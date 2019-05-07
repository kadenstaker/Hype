//
//  ChallengeStepsController.swift
//  Hype
//
//  Created by Hannah Hoff on 5/6/19.
//  Copyright © 2019 Kaden Staker. All rights reserved.
//

import Foundation

class ChallengeStepsController {
    
    static let shared = ChallengeStepsController()
    
    var steps: [ChallengeSteps] = []
    
    func startAGarden(header: String, body: String) {
        let step1 = ChallengeSteps(header: "Pick a place", body: "Almost all vegetables and most flowers need about six hours of full sun each day. Check plant tags or ask the staff at your local garden center to find out how much sun a plant requires. Put the garden where you can't ignore its pleas for attention—outside the back door, near the mailbox, by the window you stare out when you dry your hair. ")
        let step2 = ChallengeSteps(header: "Clear the ground", body: "Get rid of the sod covering the area you plan to plant. If you want quick results, you can dig it out, but it's easier to smother it with newspaper. A layer of five sheets is usually thick enough. Spread a 3-inch layer of compost (or combination of potting soil and topsoil) on the newspaper and wait. It'll take about four months for the compost and paper to decompose.")
        let step3 = ChallengeSteps(header: "Improve the Soil", body: "Invariably, soil needs a boost. The solution is simple: organic matter. Add a 2- to 3-inch layer of compost, decayed leaves, dry grass clippings, or old manure. If you dig soil (see Step 4), till the organic matter into the soil. If you decide not to dig or are working with an established bed you can't dig, leave the organic matter on the surface and it will work its way into the soil in a few months.")
        let step4 = ChallengeSteps(header: "Dig or don't", body: "Digging loosens the soil so roots can penetrate more easily. But digging when the soil is too wet or too dry can ruin its structure. Dig only when the soil is moist enough to form a loose ball in your fist, but dry enough to fall apart when you drop it. Use a spade or spading fork to gently turn the top 8 to 12 inches of soil, mixing in the organic matter from Step 3.")
        let step5 = ChallengeSteps(header: "Pick your plants", body: "Here are a few easy-to-grow plants for beginners: \nAnnual: cosmos, marigolds, impatiens, geraniums, calendula, sunflowers, and \nPerennials: Russian sage, lamb's-ears, black-eyed Susans, purple coneflowers, phlox, pansies, and da \nVegetables: lettuce, peppers, tomatoes, and cucumbers")
        let step6 = ChallengeSteps(header: "Put them in the ground", body: "Be sure to read the seed packet for information about when to plant, how deep to plant, and how far apart to plant the seeds. Be sure to keep the seeds and seedlings moist but not wet (or they may rot). An easier method is to buy young plants, called set plants or transplants. Just dig a hole and plunk them in the ground.")
        let step7 = ChallengeSteps(header: "Water!", body: "Seedlings should never dry out, so water daily while they are small. Taper off as the plants get larger. New transplants also need frequent watering—every other day or so—until their roots become established. After that, how often you need to water depends on your soil, how humid your climate is, and how often it rains. Plants are begging for water when they wilt slightly in the heat of the day. Water slowly and deeply, so the water soaks in instead of running off into the street. To minimize evaporation, water in the early morning.")
        let step8 = ChallengeSteps(header: "Mulch", body: "To help keep weeds out and water in, cover the soil with a couple of inches of mulch. All sorts of mulch are available, from pine needles to cocoa hulls to bark chips. For a vegetable garden or bed of annuals, choose a mulch that decomposes in a few months. For perennials, use a longer-lasting mulch, such as bark chips.")
        let step9 = ChallengeSteps(header: "Keep it up!", body: "Your garden is on its way. Keep watering when needed, and pull weeds before they get big. Fertilize with a dry fertilizer about halfway through the season. If you use a liquid fertilizer, fertilize every month or so. And remember to stop and smell the—well, whatever you grow.")
        
        self.steps.append(contentsOf: [step1, step2, step3, step4, step5, step6, step7, step8, step9])
    }
    
    func composting(header: String, body: String) {
        let intro = ChallengeSteps(header: nil, body: "Composting can be a fun, exciting process. Taking a little extra time to plan ahead can save a headache or simply make composting a little easier later on. Here are five important factors to consider.")
        let step1 = ChallengeSteps(header: "Distance", body: "Placing the bin adjacent to or actually in the garden will save some time and labor when it’s time to apply your finished product. The shorter trip will also be helpful when you’re adding clippings and spent plants from your garden to the bin.")
        let step2 = ChallengeSteps(header: "Water access", body: "Water is key to decomposition – a dry pile takes longer to break down. If you site your pile near a garden shed, consider collecting rain from the roof in a rain barrel to water your compost.")
        let step3 = ChallengeSteps(header: "Sun or shade?", body: "A little shade is a good thing for folks who compost in a warm, southern climate. Bins that sit in the shade of a tree or fence will lose less water to evaporation in the hot summer months. Be sure to avoid composting directly against a wooden fence. The same decomposers that are breaking down your compost could damage the fence too!")
        let step4 = ChallengeSteps(header: "Soil compact", body: "T##StringMany of the organisms that you want to live in your pile find their way in from the soil in your yard. Compost piles that are set on a concrete pad or weed fabric suffer because they are cut off from the soil ecosystem. If you’re worried about weeds sneaking in from the lawn, remove the turf below the bin and generously layer woodchips, newspaper or cardboard between the soil and the compost.")
        let step5 = ChallengeSteps(header: "Law of the land", body: "Some cities may have ordinances that regulate composting. These strict rules may have to do with what can and can’t be added to your bin or the sorts of bins that are allowed. Be sure to check with your local government, county extension service, or homeowners’ association to get the scoop on composting for your area.")
        
        self.steps.append(contentsOf: [intro, step1, step2, step3, step4, step5])
    }
    
    func greenGrocery(header: String, body: String) {
        let step1 = ChallengeSteps(header: "Shop close to home", body: "Carbon emissions are a major offender when it comes to environmental concerns.")
        let step2 = ChallengeSteps(header: "Go straight to the source, if possible", body: "Find a local farm whose principles align with your own to help the environment.")
        let step3 = ChallengeSteps(header: "Think before you buy", body: "Before you make a purchase in the grocery store, ask yourself if you’re sure you’ll use it before it goes bad.")
        let step4 = ChallengeSteps(header: "Think before you buy", body: "Before you make a purchase in the grocery store, ask yourself if you’re sure you’ll use it before it goes bad.")
        let step5 = ChallengeSteps(header: "Buy in bulk", body: "Opting to buy bulk goods is a great way to save yourself from the unwanted cardboard, tin and plastic packages for items like rice, beans, granola and a whole host of other snacks that you can find in pre-packaged containers")
        let step6 = ChallengeSteps(header: "Buy imperfect produce", body: "20 billion pounds of fruits and veggies go to waste on farms every year, oftentimes because they don't live up to the cosmetic standards of grocery stores")
        let step7 = ChallengeSteps(header: "Bring your own bags", body: "Help keep plastic out of the waste stream by bringing reusable bags to the store")
        
        self.steps.append(contentsOf: [step1, step2, step3, step4, step5, step6, step7])
    }
    
    func DIYRecyclingCenter(header: String, body: String) {
        let intro = ChallengeSteps(header: nil, body: "Create a more organized home recycling center:  ")
        let step1 = ChallengeSteps(header: "Supplies", body: "- 4 wooden crates \n- 4 tubes of brightly colored paint \n- A paint brush, \n- Alphabet stencils.")
        let step2 = ChallengeSteps(header: "Paint", body: "Paint each crate a different color and use the stencil to label each one. \nMake creates for: \n- Bottles \n- Paper \n- Cans \n- Cardboard")
        let step3 = ChallengeSteps(header: "Assemble", body: "For the two crates on the bottom, carefully use a hammer to remove one or two slats for easy access.")
        
        self.steps.append(contentsOf: [intro, step1, step2, step3])
    }
    
    func switchToLED(header: String, body: String) {
        let step1 = ChallengeSteps(header: "Switch all lightbulbs in your home to LED bulbs", body: "By replacing your home's five most frequently used light fixtures or bulbs with models that have earned the ENERGY STAR, you can save $75 each year. \nTypically LED’s use about 25%-80% less energy than traditional incandescents, saving you money and last 3-25 times longer.")
        self.steps.append(contentsOf: [step1])
    }
    
    func showerSingALong(header: String, body: String) {
        let step1 = ChallengeSteps(header: "Time your shower to your favorite song", body: "Cut down on your water use. Put on a tune that you love, hop in the shower, sing your heart out, and hop out by the time it ends. \nThe average American spends eight minutes in the shower a day, and uses about 18 gallons of water—see how much you can shave off this number today!")
        
        self.steps.append(contentsOf: [step1])
    }
    
    func useThisApp7Times(header: String, body: String) {
        let step1 = ChallengeSteps(header: "Open the app 7 times in a week", body: "Using this app everyday will improve your carbon footprint and the smallest steps are the most important.")
        
        self.steps.append(contentsOf: [step1])
    }
}
