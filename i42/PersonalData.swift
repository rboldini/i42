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
    var location: String?                   //
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
    var campus: [Campus]                    //
    var anonymize_date: String              //
    var usual_full_name: String             //
    var achievements: [Achievement] = []    //
    var image_url: String                   //
    var pool_year: String                   //
    
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
        var final_mark: Int?
        var id:Int
        var marked: Bool
        var marked_at: String?
        var occurrence:Int
        var project: ProjectInfo
        var retriable_at:String?
        var status:String
        var updated_at:String
        var validated: Bool?        // Impossible to autodecode key with "?"

        struct ProjectInfo: Decodable, Identifiable {
            var id:Int
            var name:String
            var parent_id: String?
            var slug:String
        }
    }
    
    class Achievement: Decodable, Identifiable {
        var description:String
        var id: Int
        var image: String
        var kind: String
        var name: String
        var nbr_of_success: Int?
        var tier: String
        var users_url: String
        var visible: Bool
    }
    
    class Campus: Decodable, Identifiable {
        var active: Bool
        var address: String
        var city: String
        var country: String
        var default_hidden_phone: Bool
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
        
        class CampusLanguage: Decodable, Identifiable {
            var created_at: String
            var id: Int
            var identifier: String
            var name: String
            var updated_at: String
        }
    }
    
    class Language: Decodable, Identifiable {
        var created_at: String
        var id: Int
        var language_id: Int
        var position: Int
        var user_id: Int
    }

    class Expertice: Decodable, Identifiable {
        var contact_me: Bool
        var created_at: String
        var expertise_id: Int
        var id: Int
        var interested: Bool?
        var user_id: Int
        var value: Int
    }
    
    
    class Cursus: Decodable, Identifiable {
        var begin_at: String
        var blackholed_at: String?
        var created_at: String
        var cursus: CursusInfo
        var cursus_id: Int
        var end_at: String?
        var grade: String?
        var has_coalition: Bool?
        var id: Int
        var level: Float
        var skills: [Skill] = []
        var updated_at: String
        var user: User
        
        
        class User: Decodable, Identifiable {
            var alumni: Bool
            var anonymize_date: String
            var correction_point: Int
            var created_at: String
            var displayname: String
            var email: String
            var first_name: String
            var id: Int
            var image_url: String
            var is_launched: Int?
            var last_name: String
            var location: String?
            var login: String
            var phone: String
            var pool_month: String
            var pool_year: String
            var staff: Int?
            var updated_at: String
            var url: String
            var usual_first_name: String?
            var usual_full_name: String
            var wallet: Int
        }
        
        class CursusInfo: Decodable, Identifiable {
            var created_at: String
            var id: Int
            var name: String
            var slug: String
        }
        
        class Skill: Decodable, Identifiable {
            var id: Int
            var level: Float
            var name: String
        }
    }
}


class Events: Identifiable, Decodable, Hashable {
    var id: Int
    var name: String
    var description: String
    var location: String
    var kind: String
    var max_people: Int?
    var nbr_subscribers: Int
    var begin_at: String
    var end_at: String
    var campus_ids: [Int] = []
    var cursus_ids: [Int] = []
    var themes: [Themes] = []
    var waitlist: Waitlist?
    var prohibition_of_cancellation: Int?
    var created_at: String
    var updated_at: String
    
    class Themes: Identifiable, Decodable {
        var created_at: String
        var id: Int
        var name: String
        var updated_at: String
    }
    
    class Waitlist: Identifiable, Decodable {
        var created_at: String
        var id: Int
        var updated_at: String
        var waitlistable_id: Int
        var waitlistable_type: String
    }
    
    static func == (lhs: Events, rhs: Events) -> Bool {
        guard lhs.id == rhs.id
        else { return false }
        guard lhs.name == rhs.name
        else { return false}
        return true
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }
}

