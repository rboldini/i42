//
//  PersonalData.swift
//  i42
//
//  Created by Roberto Boldini on 20/02/22.
//

import Foundation


/**
 *  This class aim to parse all necessary data from /v2/me request to Intra 42 API Server*
 *
 * Prameters :
 * data: [String:Any] = resulting json serialization of  request.

 */

class PersonalData: Decodable, Identifiable {
    var email: String                       //
    var first_name: String                  //
    var last_name: String                   //
    var location: String                    //
    var cursus_users: [Cursus] = []         //
    var expertises_users: [Expertice] = []  //
    var projects_users: [Project] = []      //
    var id: Int                             //
    var displayname: String                 //
    var url: String                         //
    var login: String                       //
    var languages_users: [Language] = []    //
    var wallet: Int                         //
    var pool_month: String                  //
    var correction_point: Int               //
    var campus: Campus                      //
    var anonymize_date: String              //
    var usual_full_name: String             //
    var achievements: [Achievement] = []    //
    var image_url: String                   //
    var pool_year: String                   //
    
//    init(data: [String: Any]) {
//        self.email = data["email"] as? String ?? "null"
//        self.first_name = data["first_name"] as? String ?? "null"
//        self.last_name = data["last_name"] as? String ?? "null"
//        self.location = data["location"] as? String ?? "null"
//        for cursus in data["cursus_users"] as? [[String: Any]] ?? [["null":"null"]] {
//            self.cursus_users.append(Cursus(data: cursus))
//        }
//        for expertice in data["expertises_users"] as? [[String: Any]] ?? [["null":"null"]] {
//            self.expertises_users.append(Expertice(data: expertice))
//        }
//        for project in data["projects_users"] as? [[String: Any]] ?? [["null":"null"]] {
//            self.projects_users.append(Project(data: project))
//        }
//        self.id = data["id"] as? Int ?? 0
//        self.displayname = data["displayname"] as? String ?? "null"
//        self.url = data["url"] as? String ?? "null"
//        for language in data["languages_users"] as? [[String: Any]] ?? [["null":"null"]] {
//            self.languages_users.append(Language(data: language))
//        }
//        self.login = data["login"] as? String ?? "null"
//        self.wallet = data["wallet"] as? Int ?? 0
//        self.pool_month = data["pool_month"] as? String ?? "null"
//        self.correction_point = data["correction_point"] as? Int ?? 0
//        self.campus = Campus(data: data["campus"] as? [String: Any] ?? ["null":"null"])
//        self.anonymize_date = data["anonymize_date"] as? String ?? "null"
//        self.usual_full_name = data["usual_full_name"] as? String ?? "null"
//        for achievement in data["achievements"] as? [[String: Any]] ?? [["null":"null"]] {
//            self.achievements.append(Achievement(data: achievement))
//        }
//        self.image_url = data["image_url"] as? String ?? "null"
//        self.pool_year = data["pool_year"] as? String ?? "null"
//    }
    
    
    /**
     Class to parse all users projects from v2/me projects_users element.
     
     ⚠️     This class is not compatible with data retrived from /me/projects or other projects request, they seems to have different structures.
     */
    struct Project: Decodable, Identifiable, Hashable {
        
        static func == (lhs: PersonalData.Project, rhs: PersonalData.Project) -> Bool {
            guard lhs.id == rhs.id
            else { return false }
            guard lhs.project.name == rhs.project.name
            else { return false}
            return true
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
            hasher.combine(project.name)
        }
        
        var created_at:String
        var current_team_id:Int
        var cursus_ids:[Int]
        var final_mark:Int
        var id:Int
        var marked:Int
        var marked_at:String
        var occurrence:Int
        var project: ProjectInfo
        var retriable_at:String
        var status:String
        var updated_at:String
        var validated:Int
        
//        init(data:[String: Any]) {
//                created_at = data["created_at"] as? String ?? "null"
//                current_team_id = data["current_team_id"] as? Int ?? 0
//                cursus_ids = data["cursus_ids"] as? [Int] ?? [0]
//                final_mark = data["final_mark"] as? Int ?? 0
//                id = data["id"] as? Int ?? 0
//                marked = data["marked"] as? Int ?? 0
//                marked_at = data["marked_at"] as? String ?? "null"
//                occurrence = data["occurrence"] as? Int ?? 0
//                project = ProjectInfo(data: data["project"] as? [String: Any] ?? ["null":"null"])
//                retriable_at = data["retriable_at"] as? String ?? "null"
//                status = data["status"] as? String ?? "null"
//                updated_at = data["updated_at"] as? String ?? "null"
//                validated = data["validated?"] as? Int ?? 0
//        }

        struct ProjectInfo: Decodable, Identifiable {
            var id:Int
            var name:String
            var parent_id:String
            var slug:String
            
//            init(data: [String: Any]) {
//                id = data["id"] as? Int ?? 0
//                name = data["name"] as? String ?? "null"
//                parent_id = data["parent_id"] as? String ?? "null"
//                slug = data["slug"] as? String ?? "null"
//            }
        }
        
    }
    
    class Achievement: Decodable, Identifiable {
        var description:String
        var id: Int
        var image: String
        var kind: String
        var name: String
        var nbr_of_success:Int
        var tier: String
        var users_url: String
        var visible: Int
        
//        init(data: [String: Any]) {
//            self.description = data["description"] as? String ?? "null"
//            self.id = data["id"] as? Int ?? 0
//            self.image = data["image"] as? String ?? "null"
//            self.kind = data["kind"] as? String ?? "null"
//            self.name = data["name"] as? String ?? "null"
//            self.nbr_of_success = data["nbr_of_success"] as? Int ?? 0
//            self.tier = data["tier"] as? String ?? "null"
//            self.users_url = data["users_url"] as? String ?? "null"
//            self.visible = data["visible"] as? Int ?? 0
//        }
    }
    
    class Campus: Decodable, Identifiable {
        var active: Int
        var address: String
        var city: String
        var country: String
        var default_hidden_phone: Int
        var email_extension: String
        var facebook: String
        var id: Int
        var language: CampusLanguage
        var name: String
        var time_zone: String
        var twitter: String
        var users_count: Int
        var vogsphere_id: Int
        var website: String
        var zip: String
        
//        init(data: [String: Any]) {
//            self.active = data["active"] as? Int ?? 0
//            self.address = data["address"] as? String ?? "null"
//            self.city = data["city"] as? String ?? "null"
//            self.country = data["country"] as? String ?? "null"
//            self.default_hidden_phone = data["default_hidden_phone"] as? Int ?? 0
//            self.email_extension = data["email_extension"] as? String ?? "null"
//            self.facebook = data["facebook"] as? String ?? "null"
//            self.id = data["id"] as? Int ?? 0
//            self.language = CampusLanguage(data: data["language"] as? [String: Any] ?? [:])
//            self.name = data["name"] as? String ?? "null"
//            self.time_zone = data["time_zone"] as? String ?? "null"
//            self.twitter = data["twitter"] as? String ?? "null"
//            self.users_count = data["users_count"] as? Int ?? 0
//            self.vogsphere_id = data["vogsphere_id"] as? Int ?? 0
//            self.website = data["website"] as? String ?? "null"
//            self.zip = data["zip"] as? String ?? "null"
//        }
        
        class CampusLanguage: Decodable, Identifiable {
            var created_at: String
            var id: Int
            var identifier: String
            var name: String
            var updated_at: String
            
//            init(data: [String: Any]) {
//                self.created_at = data["created_at"] as? String ?? "null"
//                self.id = data["id"] as? Int ?? 0
//                self.identifier = data["identifier"] as? String ?? "null"
//                self.name = data["name"] as? String ?? "null"
//                self.updated_at = data["updated_at"] as? String ?? "null"
//            }
        }
    }
    
    class Language: Decodable, Identifiable {
        var created_at: String
        var id: Int
        var language_id: Int
        var position: Int
        var user_id: Int
        
//        init(data: [String: Any]) {
//            self.created_at = data["created_at"] as? String ?? "null"
//            self.id = data["id"] as? Int ?? 0
//            self.language_id = data["language_id"] as? Int ?? 0
//            self.position = data["position"] as? Int ?? 0
//            self.user_id = data["user_id"] as? Int ?? 0
//        }
    }

    class Expertice: Decodable, Identifiable {
        var contact_me: Int
        var created_at: String
        var expertise_id: Int
        var id: Int
        var interested: Int
        var user_id: Int
        var value: Int
        
//        init(data: [String: Any]) {
//            self.contact_me = data["contact_me"] as? Int ?? 0
//            self.created_at = data["created_at"] as? String ?? "null"
//            self.expertise_id = data["expertise_id"] as? Int ?? 0
//            self.id = data["id"] as? Int ?? 0
//            self.interested = data["interested"] as? Int ?? 0
//            self.user_id = data["user_id"] as? Int ?? 0
//            self.value = data["value"] as? Int ?? 0
//        }
    }
    
    
    class Cursus: Decodable, Identifiable {
        var begin_at: String
        var blackholed_at: String
        var created_at: String
        var cursus: CursusInfo
        var cursus_id: Int
        var end_at: String
        var grade: String
        var has_coalition: Int
        var id: Int
        var level: String
        var skills: [Skill] = []
        var updated_at: String
        var user: User
        
//        init(data:[String: Any]) {
//            self.begin_at = data["begin_at"] as? String ?? "null"
//            self.blackholed_at = data["blackholed_at"] as? String ?? "null"
//            self.created_at = data["created_at"] as? String ?? "null"
//            self.cursus = CursusInfo(data: data["cursus"] as? [String: Any] ?? [:])
//            self.cursus_id = data["cursus_id"] as? Int ?? 0
//            self.end_at = data["end_at"] as? String ?? "null"
//            self.grade = data["grade"] as? String ?? "null"
//            self.has_coalition = data["has_coalition"] as? Int ?? 0
//            self.id = data["id"] as? Int ?? 0
//            self.level = data["level"] as? String ?? "null"
//            self.updated_at = data["updated_at"] as? String ?? "null"
//            self.user = User(data: data["user"] as? [String: Any] ?? [:])
//            skills = decodeSkills(data: data["skills"] as? [[String: Any]] ?? [[:]])
//        }
        
        
//        func decodeSkills(data: [[String: Any]]) -> [Skill] {
//            var tmp: [Skill] = []
//            for skill in data { tmp.append( Skill( data: skill ) ) }; return tmp;}
        
        
        class User: Decodable, Identifiable {
            var alumni: Int
            var anonymize_date: String
            var correction_point: Int
            var created_at: String
            var displayname: String
            var email: String
            var first_name: String
            var id: Int
            var image_url: String
            var is_launched: Int
            var last_name: String
            var location: String
            var login: String
            var phone: String
            var pool_month: String
            var pool_year: Int
            var staff: Int
            var updated_at: String
            var url: String
            var usual_first_name: String
            var usual_full_name: String
            var wallet: Int
            
//            init(data: [String: Any]) {
//                self.alumni = data["alumni"] as? Int ?? 0
//                self.anonymize_date = data["anonymize_date"] as? String ?? "null"
//                self.correction_point = data["correction_point"] as? Int ?? 0
//                self.created_at = data["created_at"] as? String ?? "null"
//                self.displayname = data["displayname"] as? String ?? "null"
//                self.email = data["email"] as? String ?? "null"
//                self.first_name = data["first_name"] as? String ?? "null"
//                self.id = data["id"] as? Int ?? 0
//                self.image_url = data["image_url"] as? String ?? "null"
//                self.is_launched = data["is_launched"] as? Int ?? 0
//                self.last_name = data["last_name"] as? String ?? "null"
//                self.location = data["location"] as? String ?? "null"
//                self.login = data["login"] as? String ?? "null"
//                self.phone = data["phone"] as? String ?? "null"
//                self.pool_month = data["pool_month"] as? String ?? "null"
//                self.pool_year = data["pool_year"] as? Int ?? 0
//                self.staff = data["staff"] as? Int ?? 0
//                self.updated_at = data["updated_at"] as? String ?? "null"
//                self.url = data["url"] as? String ?? "null"
//                self.usual_first_name = data["usual_first_name"] as? String ?? "null"
//                self.usual_full_name = data["usual_full_name"] as? String ?? "null"
//                self.wallet = data["wallet"] as? Int ?? 0
//            }
        }
        
        class CursusInfo: Decodable, Identifiable {
            var created_at: String
            var id: Int
            var name: String
            var slug: String
            
//            init(data: [String: Any]) {
//                self.created_at = data["created_at"] as? String ?? "null"
//                self.id = data["id"] as? Int ?? 0
//                self.name = data["name"] as? String ?? "null"
//                self.slug = data["slug"] as? String ?? "null"
//            }
        }
        
        class Skill: Decodable, Identifiable {
            var id: Int
            var level: String
            var name: String
            
//            init(data: [String: Any]) {
//                self.id = data["id"] as? Int ?? 0
//                self.level = data["level"] as? String ?? "null"
//                self.name = data["name"] as? String ?? "null"
//            }
        }
        
    }
}


