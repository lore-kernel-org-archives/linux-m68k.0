From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4 00/14] Modernization and fixes for NuBus subsystem
Date: Sun, 7 Jan 2018 11:14:09 +0100
Message-ID: <CAMuHMdWnSTLAq+Ec6Ogoqfg-EdkjKzNkBMtL2h0wXUCy9ChFXg@mail.gmail.com>
References: <cover.1513220582.git.fthain@telegraphics.com.au>
 <CAMuHMdX1Z0y2u1nkj3GqF5N3jYBYvfjM9_jJKH0zM23DBNjhOw@mail.gmail.com> <alpine.LNX.2.21.1801060823160.3@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.21.1801060823160.3@nippy.intranet>
Sender: linux-kernel-owner@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Hi Finn,

On Sat, Jan 6, 2018 at 4:34 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> On Fri, 5 Jan 2018, Geert Uytterhoeven wrote:
>> I assume you meant this to go in through the m68k tree?
>
> Yes, please. Because the NuBus-PowerMac port is out-of-tree, the m68k tree
> seems more appropriate than the powerpc tree for this submission.

OK.

>> Can you please run this through checkpatch, and fix the reported white
>> space and other real (some are false positives) issues?
>
> Checkpatch is great but it is also incredibly noisy. So I missed a long
> line that should have been wrapped in patch 4/14 and another in 5/14.
> Sorry about that.
>
> Checkpatch said, "Symbolic permissions are not preferred". But I didn't
> find any advice in the style guide, so I just retained the existing code
> style. What is your preference here?

If you add new users, please use octal permissions, as they're easier to read.
If you just move code, keep it like it is. You may want to add an additional
patch to convert from symbolic to octal permissions, though.

> Checkpatch also said, "code indent should use tabs where possible" though
> I've used only tabs to indent (according to scope, of course). Checkpatch
> also says, "please, no spaces at the start of a line". Yet it is common
> practice to put spaces at the start of a continuation (after any
> indentation tabs, of course) when wrapping lines*. Please let me know your
> preference.

Checkpatch does not complain when padding TABs with a few spaces to make
continuations match the previous line. it does complain when using spaces only
("please, no spaces at the _start_ of a line").

> Checkpatch asked, "added, moved or deleted file(s), does MAINTAINERS need
> updating?" Regarding drivers/nubus/*, that question is not a new one. The
> issue can be addressed in this patch or an earlier one, so as to keep
> checkpatch happy, or it can be addressed in a separate submission... Do we
> bring drivers/nubus/* under the Mac 68k subsystem? Isn't it a subsystem
> itself? (If maintain that code, do I get to exercise my discretion
> regarding checkpatch limitations?)

That's just a question. Do you want to assume maintainership for nubus?

> The rest of the checkpatch output seems to be irrelevant (or am I missing
> something?) --
>
>     Macros with complex values should be enclosed in parentheses
>
>     trailing statements should be on next line
>
>     Possible unwrapped commit description
>
>     braces {} are not necessary for single statement blocks
>
>     file is marked as 'obsolete' in the MAINTAINERS hierarchy.  No
>     unnecessary modifications please.
>
>     suspect code indent for conditional statements
>
> Please let me know how you would like me to address these issues, and I'll
> re-submit.

Most (all?) of these are indeed false positives.

> * IMO checkpatch is really good at certain things but line wrap isn't one
> of them. The git project's Documentation/CodingGuidelines seems to be a
> better description of Linux development practice than checkpatch's regexps:
>
>    There are two schools of thought when it comes to splitting a long
>    logical line into multiple lines.  Some people push the second and
>    subsequent lines far enough to the right with tabs and align them:
>
>         if (the_beginning_of_a_very_long_expression_that_has_to ||
>                 span_more_than_a_single_line_of ||
>                 the_source_text) {
>                 ...
>
>    while other people prefer to align the second and the subsequent
>    lines with the column immediately inside the opening parenthesis,
>    with tabs and spaces, following our "tabstop is always a multiple
>    of 8" convention:
>
>         if (the_beginning_of_a_very_long_expression_that_has_to ||
>             span_more_than_a_single_line_of ||
>             the_source_text) {
>                 ...
>
>    Both are valid, and we use both.  Again, just do not mix styles in
>    the same part of the code and mimic existing styles in the
>    neighbourhood.

And both are accepted by checkpatch. So if it does warn, check your TABs
and spaces again.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
