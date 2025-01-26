// // sync_service.dart
// import 'dart:async';

// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'medication_table.dart';

// class SyncService {
//   final SupabaseClient supabase;
//   final MedicationTable medicationTable = MedicationTable();
//   bool _isSyncing = false;
//   static const String LAST_SYNC_KEY = 'last_sync_timestamp';

//   SyncService(this.supabase);

//   Future<String?> _getLastSyncTimestamp() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString(LAST_SYNC_KEY);
//   }

//   Future<void> _updateLastSyncTimestamp() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(LAST_SYNC_KEY, DateTime.now().toUtc().toIso8601String());
//   }

//   Future<void> syncWithSupabase() async {
//     if (_isSyncing) return;
    
//     try {
//       _isSyncing = true;
      
//       // Get all unsynced local records
//       final unsyncedMedications = await medicationTable.getUnsyncedMedications();
      
//       // Push local changes to Supabase
//       for (var med in unsyncedMedications) {
//         try {
//           final localId = med['id'];
//           med.remove('id'); // Remove local ID before pushing
//           med.remove('is_synced');
//           med['updated_at'] = DateTime.now().toUtc().toIso8601String();
          
//           final response = await supabase
//               .from('medications')
//               .insert(med)
//               .select()
//               .single();
          
//           if (response != null) {
//             // Update local record with server ID and mark as synced
//             await medicationTable.updateMedicationAfterSync(
//               localId, 
//               response['id'],
//               true
//             );
//           }
//         } catch (e) {
//           print('Error syncing medication: $e');
//           continue;
//         }
//       }

//       // Pull server changes
//       final lastSync = await _getLastSyncTimestamp();
//       final query = supabase
//           .from('medications')
//           .select()
//           .order('updated_at', ascending: true);
      
//       if (lastSync != null) {
//         query.gt('updated_at', lastSync);
//       }

//       final serverRecords = await query;
      
//       // Update local database with server records
//       if (serverRecords != null) {
//         for (var record in serverRecords) {
//           record['is_synced'] = 1;
//           await medicationTable.insertOrUpdateMedication(record);
//         }
//       }

//       await _updateLastSyncTimestamp();
      
//     } catch (e) {
//       print('Sync error: $e');
//       rethrow;
//     } finally {
//       _isSyncing = false;
//     }
//   }

//   void startSyncService() {
//     // Initial sync
//     syncWithSupabase();
    
//     // Set up periodic sync (every 15 minutes)
//     Timer.periodic(const Duration(minutes: 15), (_) {
//       syncWithSupabase();
//     });
    
//     // Listen for connectivity changes
//     Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
//       if (result != ConnectivityResult.none) {
//         syncWithSupabase();
//       }
//     });
//   }

//   Future<void> forceSyncNow() async {
//     await syncWithSupabase();
//   }
// }
