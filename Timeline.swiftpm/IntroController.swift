//
//  IntroController.swift
//  WWDC-2022
//
//  Created by Larissa Gomes de Stefano Escaliante on 23/04/22.
//

class IntroController {
    var numFrameStory = 0
    
    let dialogs = [
        """
        Greetings, time traveler!
        How are you? We haven't seen for a long space-time.
        """,
        """
        I am very sad about some things I heard about the history of science, and I come to ask for your help in a very important mission!
        """,
        """
        Have you ever noticed that the biggest names in science we know are all men?
        """,
        """
        Historically, women have always had a hard time doing science.
        Even studying they were forbidden, so imagine what it was like to publish academic articles!
        """,
        """
        And even occupying these environments, they still suffered from several problems generated by structural sexism, being forced to be in the shadow of other men.
        For this reason, women ended up being erased from the history of science.
        """,
        """
        And I think it's our duty as guardians of space-time to make amends for these historical issues.
        My next mission will be to go back in time and help these women get the recognition they deserve for their work.
        """,
        """
        To make my trip, it will be necessary first to synchronize the time machine, putting the events in the order in which they happened.
        Can you help me sort out the scientific discoveries of some women who were very important to our society, but ended up being erased?
        """
    ]
    
    let sylviaIlustration = [
        "sylvia-happy",
        "sylvia-sad",
        "sylvia-indagating",
        "sylvia-informing",
        "sylvia-informing",
        "sylvia-excited",
        "sylvia-asking"
    ]
    
    func updateFrameAndCheckEnded() -> Bool {
        numFrameStory += 1
        return numFrameStory == dialogs.count
    }
    
    func getDataCurrentFrame() -> String {
        return dialogs[numFrameStory]
    }
    
    func getSylviaIlustrationCurrentFrame() -> String {
        return sylviaIlustration[numFrameStory]
    }
}
