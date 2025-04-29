//
//  ContentView.swift
//  JansunwAI
//
//  Created by Rohan Prakash on 17/04/25.
//

import SwiftUI



struct HomeView: View {
    @State private var grievances: [Grievance] = [
          Grievance(title: "Drainage and Waterlogging issue", description: "In Kanpur’s older Cantonment area, the aging drainage network fails to cope with even moderate rainfall, leading to waterlogged streets that cripple morning commutes and disrupt local businesses. Residents report knee‑deep stagnant water seeping into ground‑floor homes, bringing foul odors and breeding grounds for mosquitoes that spread diseases. Local markets shut down temporarily, children miss school, and emergency services struggle to reach affected zones. Despite repeated appeals to the municipal corporation, clogged drains remain uncleared. Urgent rehabilitation of pipelines, installation of additional stormwater drains, and regular maintenance schedules are essential to safeguard public health and restore normalcy.", status: "Pending", lastUpdated: Date(timeIntervalSinceNow: -86400 * 1)),
          Grievance(title: "Poor working condition and delayed wage payments", description: "At a manufacturing unit on the outskirts of Lucknow, daily‑wage laborers endure cramped, poorly ventilated workshops with minimal lighting and inadequate sanitation facilities. For the past three months, over a hundred workers have not received promised wages, forcing families to skip meals and accumulate debt. Safety gear such as helmets and gloves is either substandard or entirely absent, heightening risks of accidents from heavy machinery. Complaints to supervisors are met with delays, and government labor inspectors have yet to intervene. Immediate action is needed: timely salary disbursal, strict enforcement of workplace safety norms, and regular audits to protect vulnerable workers. ", status: "In Progress", lastUpdated: Date(timeIntervalSinceNow: -86400 * 2)),
          Grievance(title: "Uncollected garbage in Ghaziabad neighborhoods", description: "In several residential colonies of Ghaziabad, overflowing bins and uncollected waste have become a persistent eyesore and health hazard. Piles of plastic, organic scraps, and discarded furniture line the streets, attracting stray dogs and rodents that spread infections. Foul odors permeate the air, aggravating respiratory issues among elderly residents and children. Waste collectors visit erratically, and mechanized tippers often break down on narrow lanes. Despite civic body assurances, no improvement is seen. A structured door‑to‑door pickup schedule, functional collection vehicles, community awareness programs, and swift action against illegal dumping are crucial to restoring hygiene and public confidence in municipal services.", status: "Pending", lastUpdated: Date(timeIntervalSinceNow: -86400 * 3)),
          Grievance(title: "Streetlights not working in Noida", description: "In Sector 20 of Noida, dozens of streetlights remain dark long after sunset, creating perilous conditions for pedestrians and motorists. Poorly lit roads have witnessed multiple minor accidents and an uptick in petty crime, as dim corners provide cover for trespassers. Resident welfare associations report blown fuses and corroded wiring, yet replacement bulbs and repair crews arrive sporadically. Women and senior citizens avoid evening walks, fearing for personal safety. A comprehensive audit of lighting infrastructure, prompt replacement of faulty equipment, and a 24/7 maintenance hotline would greatly improve security, encourage outdoor activity, and enhance overall quality of life in the community.", status: "Resolved", lastUpdated: Date(timeIntervalSinceNow: -86400 * 5)),
          Grievance(title: "Potholes on highway near Aligarh", description: "On the stretch of NH‑91 connecting Aligarh to Mathura, large potholes erupt after each rain, turning the road into a hazard zone for commuters and heavy vehicles. Buses and trucks swerve dangerously to avoid craters, causing traffic delays and increasing the risk of collisions. Local transport unions report frequent tire blowouts and suspension damage, leading to higher repair costs for operators and fares for passengers. Despite visible warnings, no temporary repair measures are in place. Immediate resurfacing, installation of proper signage, and regular monitoring by the public works department are necessary to prevent accidents and ensure smooth transit along this vital corridor.", status: "In Progress", lastUpdated: Date(timeIntervalSinceNow: -86400 * 7)),
          Grievance(title: "Broken water pipeline in Bareilly", description: "Residents of Civil Lines in Bareilly have endured a leaking main water pipeline for over two weeks, resulting in significant water loss and sinking roadbeds. Continuous seepage has carved trenches alongside footpaths, posing tripping hazards and undermining adjacent building foundations. Daily water supply schedules are disrupted as pressure drops, forcing families to rely on expensive tanker services. Efforts by local contractors to patch the rupture have failed repeatedly. A permanent solution requires replacing corroded pipe segments, conducting pressure tests, and establishing a rapid response team for future leaks to maintain safe roads and reliable water delivery for the community.", status: "Pending", lastUpdated: Date(timeIntervalSinceNow: -86400 * 4)),
          Grievance(title: "Improper waste disposal at Varanasi ghats", description: "Along the historic ghats of Varanasi, waste disposal practices have deteriorated, with plastic bottles, food scraps, and ritual offerings left to decompose on riverbanks. Overflowing bins attract pests and leach contaminants into the Ganges, threatening aquatic life and undermining efforts to maintain water purity for pilgrims. The stench deters tourism and poses health risks to local priests and boatmen. Despite installation of segregation bins, collection frequency remains low and public awareness campaigns are limited. Enhanced cleaning schedules, stricter enforcement of littering fines, and community engagement initiatives are essential to preserve the sanctity of this sacred heritage site and protect public health.", status: "Pending", lastUpdated: Date(timeIntervalSinceNow: -86400 * 6)),
          Grievance(title: "Overcharging auto-rickshaws in Prayagraj", description: "In Prayagraj’s busy Civil Lines area, commuters frequently face exorbitant auto-rickshaw fares as drivers refuse to use meters, especially during festival seasons. Tourists and elderly passengers are particularly vulnerable to inflated charges, sometimes paying double the standard rate. Attempts to negotiate fares lead to delays and confrontations. Transport department spot‑checks are rare, and penalty collection is negligible. A reinforced regulatory framework, regular meter‑calibration drives, undercover inspections, and a public grievance portal for fare disputes would help restore fairness in local transit, ensure accountability among drivers, and protect citizens from exploitative practices.", status: "In Progress", lastUpdated: Date(timeIntervalSinceNow: -86400 * 2)),
          Grievance(title: "Water scarcity in Meerut colony", description: "In the Rajendra Nagar colony of Meerut, piped water arrives for only two hours each alternate day, leaving households scrambling for storage and resorting to private tankers at high cost. Elderly residents and low‑income families struggle to secure sufficient water for cooking, cleaning, and hygiene. Borewells run dry, and community wells are contaminated. Despite promises of new pumping stations, no work has commenced. Urgent measures include optimizing existing pump operations, repairing pipeline leaks, drilling additional community borewells, and implementing rainwater harvesting systems to ensure equitable, sustainable water access for all residents in this rapidly growing urban area.", status: "Pending", lastUpdated: Date(timeIntervalSinceNow: -86400 * 10)),
          Grievance(title: "Open manhole in Moradabad", description: "An uncovered manhole on the main road near Moradabad Railway Station endangers pedestrians, cyclists, and vehicles, especially at night when visibility is low. Local children play nearby unaware of the risk, and two accidents have already been reported this week. Temporary wooden planks placed over the opening are unstable and hazardous. Despite requests to the municipal health department, no permanent cover has been installed. A sturdy, lockable iron grate, clear warning signs, and routine inspections would prevent injuries, protect commuters, and demonstrate municipal commitment to public safety in this high-traffic zone.", status: "Resolved", lastUpdated: Date(timeIntervalSinceNow: -86400 * 8)),
          Grievance(title: "Tree blocking traffic light in Greater Noida", description: "A centuries-old banyan tree at the intersection of Knowledge Park Road shades the traffic signal in Greater Noida, obscuring light visibility for northbound vehicles. Drivers report confusion over signal phases, leading to abrupt stops and near-miss collisions. Pruning attempts have been informal and incomplete, with branches quickly regrowing. Urban forestry rules restrict removal without proper clearance. A balanced solution involves selective branch trimming, installation of additional signal heads at visible angles, and periodic maintenance by civic authorities to ensure both road safety and preservation of urban greenery.", status: "Pending", lastUpdated: Date(timeIntervalSinceNow: -86400 * 3)),
          Grievance(title: "Sewage overflow in Gorakhpur", description: "In Gorakhpur’s Khajriya locality, a cracked underground sewer line causes raw sewage to surface onto streets after heavy rains, contaminating water sources and endangering public health. Residents avoid using roadside taps, fearing waterborne diseases like cholera and dysentery. Children play in contaminated puddles, and makeshift drains redirect waste toward residential compounds. Despite alerts to the sanitation department, repairs are delayed due to lack of materials and labor. A comprehensive repair plan, replacement of damaged pipelines, temporary diversion channels, and community health monitoring are vital to prevent an outbreak and restore sanitary conditions in the neighborhood.", status: "Pending", lastUpdated: Date(timeIntervalSinceNow: -86400 * 11)),
          Grievance(title: "Noise pollution due to illegal events in Agra", description: "In the Shahganj area of Agra, unauthorized loud music events run past midnight in residential zones, disrupting sleep and causing stress among families and elderly residents. Sound levels regularly exceed permissible limits, and event organizers lack proper licenses. Police intervention is infrequent and fines are seldom imposed. Children preparing for exams find concentration difficult, and patients in nearby clinics experience aggravated health conditions. Installing noise meters, enforcing curfews, issuing on-the-spot fines, and requiring event permits with community consent would help mitigate disturbances and uphold residents’ right to a peaceful living environment.", status: "In Progress", lastUpdated: Date(timeIntervalSinceNow: -86400 * 1)),
          Grievance(title: "Encroachment on footpaths in Saharanpur", description: "Market vendors in Saharanpur’s Tilak Bazaar regularly spill onto pavements, leaving pedestrians to navigate busy roadways and risking accidents. Makeshift stalls block accessibility for elderly and disabled citizens, and emergency vehicles struggle to pass during peak hours. Municipal authorities’ occasional clearance drives are followed by rapid reoccupation. Lack of designated vending zones and inadequate enforcement perpetuate the issue. Creating structured vendor areas, clear demarcation of pedestrian pathways, regular monitoring squads, and stakeholder consultations would ensure safe footpath access while supporting local livelihoods in this bustling trade hub.", status: "Pending", lastUpdated: Date(timeIntervalSinceNow: -86400 * 6)),
          Grievance(title: "Construction debris on roads in Ayodhya", description: "Ongoing temple renovation projects in Ayodhya have led to large volumes of construction debris dumped along side roads, causing dust clouds, obstructing traffic, and damaging vehicle exteriors. Pedestrians risk injury from falling chunks of mortar and loose bricks. Street-cleaning crews lack sufficient equipment to clear heavy rubble, and drainage channels are clogged with waste, exacerbating flood risk. Residents report respiratory irritation and frequent flat tires from sharp debris. Coordinated waste removal schedules, onsite debris grinders, protective barricades around work zones, and strict contractor accountability measures are needed to maintain road safety and community health.", status: "In Progress", lastUpdated: Date(timeIntervalSinceNow: -86400 * 4)),
          Grievance(title: "Illegal parking outside school in Aligarh", description: "Outside Aligarh Muslim University’s Women’s College, unauthorized vehicles park along narrow lanes during drop-off hours, forcing students to walk on the carriageway and risking traffic accidents. Parking attendants demand fees with no official authorization, and no clear signage indicates no-parking zones. School buses face delays, and parents complain of chaotic traffic management. Installation of bollards, marked parking bays, visible no-parking signage, and deployment of traffic marshals during peak hours would secure safe access for students and streamline vehicle flow in this academic precinct.", status: "Resolved", lastUpdated: Date(timeIntervalSinceNow: -86400 * 9)),
          Grievance(title: "Animal menace in Bareilly", description: "Stray cattle and dogs roam freely in Bareilly’s Civil Lines district, rummaging through garbage and occasionally charging at passersby. Nighttime residents wake to barking packs, and early morning joggers risk collisions with loose animals. Municipal shelters are overcrowded, and capture‑neuter‑release programs lack funding. Roadside grazing damages ornamental lawns and park vegetation. Coordinated animal control measures—including expanded shelter capacity, regular vaccination and sterilization drives, and community reporting apps—are essential to balance animal welfare with human safety in this growing urban center.", status: "Pending", lastUpdated: Date(timeIntervalSinceNow: -86400 * 12)),
          Grievance(title: "Flooded underpass in Kanpur", description: "The underpass near Kanpur Central Railway Station floods within hours of light rain due to silted drains and malfunctioning pumps. Commuters wade through waist-high water or detour miles around, missing trains and appointments. Vendors’ stalls are submerged, causing economic losses, and the electric control panel for lighting risks short-circuiting. Despite contractor pledges, no permanent de-silting schedule exists. Urgent dredging, pump maintenance, installation of flood sensors, and real-time public alerts are imperative to restore safe, uninterrupted passage through this critical transit point.", status: "Pending", lastUpdated: Date(timeIntervalSinceNow: -86400 * 5))
      ]

    var body: some View {
        NavigationView {
            ZStack{
                Color.gray.opacity(0.4).edgesIgnoringSafeArea(.all)
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(grievances) { grievance in
                            NavigationLink(destination: GrievanceDetailView(grievance: grievance)) {
                                VStack(alignment: .leading, spacing: 6) {
                                    HStack {
                                        Text(grievance.title)
                                            .font(.headline)
                                            .foregroundColor(.primary)
                                        Spacer()
                                        Text(timeAgo(grievance.lastUpdated))
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                    Text(grievance.description)
                                        .font(.subheadline)
                                        .lineLimit(2)
                                        .foregroundColor(.secondary)
                                    HStack {
                                        Spacer()
                                        Text(grievance.status)
                                            .font(.caption)
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 4)
                                            .background(color(for: grievance.status).opacity(0.2))
                                            .foregroundColor(color(for: grievance.status))
                                            .cornerRadius(12)
                                    }
                                }
                                .padding()
                                .background(Color(.systemBackground))
                                .cornerRadius(16)
                                .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding(.horizontal)
                        }
                    }
                    .padding(.top)
                }
                .navigationTitle("Grievances")
            }
           
        }
        .navigationBarBackButtonHidden(true)
    }

    func color(for status: String) -> Color {
        switch status {
        case "Resolved": return .green
        case "In Progress": return .orange
        default: return .red
        }
    }

    func timeAgo(_ date: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .short
        return formatter.localizedString(for: date, relativeTo: Date())
    }
}

#Preview {
    HomeView()
}
