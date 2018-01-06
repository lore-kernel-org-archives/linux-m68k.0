From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH v4 00/14] Modernization and fixes for NuBus subsystem
Date: Sat, 6 Jan 2018 14:34:56 +1100 (AEDT)
Message-ID: <alpine.LNX.2.21.1801060823160.3@nippy.intranet>
References: <cover.1513220582.git.fthain@telegraphics.com.au> <CAMuHMdX1Z0y2u1nkj3GqF5N3jYBYvfjM9_jJKH0zM23DBNjhOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:48930 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753630AbeAFDe5 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 5 Jan 2018 22:34:57 -0500
In-Reply-To: <CAMuHMdX1Z0y2u1nkj3GqF5N3jYBYvfjM9_jJKH0zM23DBNjhOw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Geert,

On Fri, 5 Jan 2018, Geert Uytterhoeven wrote:

> 
> I assume you meant this to go in through the m68k tree?
> 

Yes, please. Because the NuBus-PowerMac port is out-of-tree, the m68k tree 
seems more appropriate than the powerpc tree for this submission.

> Can you please run this through checkpatch, and fix the reported white 
> space and other real (some are false positives) issues?
> 

Checkpatch is great but it is also incredibly noisy. So I missed a long 
line that should have been wrapped in patch 4/14 and another in 5/14. 
Sorry about that.

Checkpatch said, "Symbolic permissions are not preferred". But I didn't 
find any advice in the style guide, so I just retained the existing code 
style. What is your preference here?

Checkpatch also said, "code indent should use tabs where possible" though 
I've used only tabs to indent (according to scope, of course). Checkpatch 
also says, "please, no spaces at the start of a line". Yet it is common 
practice to put spaces at the start of a continuation (after any 
indentation tabs, of course) when wrapping lines*. Please let me know your 
preference.

Checkpatch asked, "added, moved or deleted file(s), does MAINTAINERS need 
updating?" Regarding drivers/nubus/*, that question is not a new one. The 
issue can be addressed in this patch or an earlier one, so as to keep 
checkpatch happy, or it can be addressed in a separate submission... Do we 
bring drivers/nubus/* under the Mac 68k subsystem? Isn't it a subsystem 
itself? (If maintain that code, do I get to exercise my discretion 
regarding checkpatch limitations?)

The rest of the checkpatch output seems to be irrelevant (or am I missing 
something?) --

    Macros with complex values should be enclosed in parentheses

    trailing statements should be on next line

    Possible unwrapped commit description

    braces {} are not necessary for single statement blocks

    file is marked as 'obsolete' in the MAINTAINERS hierarchy.  No 
    unnecessary modifications please.

    suspect code indent for conditional statements

Please let me know how you would like me to address these issues, and I'll 
re-submit.

Thanks for your review.

* IMO checkpatch is really good at certain things but line wrap isn't one 
of them. The git project's Documentation/CodingGuidelines seems to be a 
better description of Linux development practice than checkpatch's regexps:

   There are two schools of thought when it comes to splitting a long
   logical line into multiple lines.  Some people push the second and
   subsequent lines far enough to the right with tabs and align them:

        if (the_beginning_of_a_very_long_expression_that_has_to ||
                span_more_than_a_single_line_of ||
                the_source_text) {
                ...

   while other people prefer to align the second and the subsequent
   lines with the column immediately inside the opening parenthesis,
   with tabs and spaces, following our "tabstop is always a multiple
   of 8" convention:

        if (the_beginning_of_a_very_long_expression_that_has_to ||
            span_more_than_a_single_line_of ||
            the_source_text) {
                ...

   Both are valid, and we use both.  Again, just do not mix styles in
   the same part of the code and mimic existing styles in the
   neighbourhood.

-- 
