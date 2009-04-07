From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: debian kernel m68k patches for 2.6.29
Date: Tue, 7 Apr 2009 09:14:32 +0200
Message-ID: <10f740e80904070014o479b9a45u45b2f9bb7a175b73@mail.gmail.com>
References: <20090326123822.GD8081@marenka.net>
	 <10f740e80903260610k29f73c4ci76594f46881e17a5@mail.gmail.com>
	 <10f740e80903290607y743bada9w829754722e9f7d9f@mail.gmail.com>
	 <alpine.DEB.1.00.0904062346180.32327@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ew0-f165.google.com ([209.85.219.165]:37221 "EHLO
	mail-ew0-f165.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751452AbZDGHOg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 7 Apr 2009 03:14:36 -0400
Received: by ewy9 with SMTP id 9so2271529ewy.37
        for <linux-m68k@vger.kernel.org>; Tue, 07 Apr 2009 00:14:33 -0700 (PDT)
In-Reply-To: <alpine.DEB.1.00.0904062346180.32327@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Stephen R Marenka <stephen@marenka.net>, debian-68k@lists.debian.org, linux-m68k@vger.kernel.org

On Tue, Apr 7, 2009 at 01:48, Michael Schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
>> Now my git skills have been growing, I created two new branches:
>> =C2=A0 - m68k-v2.6.29
>> =C2=A0 - queue
>
> Cool...
>
> I had to fix a merge conflict in atari_defconfig and multi_defconfig
> when pulling the m68k-v2.6.29 branch (EtherNEC builtin vs. module, wh=
ich is the
> correct setting?). Looks like I better restart from a fresh clone jus=
t for the
> Debian stuff.

If you pulled from my master branch before, and now try to merge the
m68k-v2.6.29 branch,
then you will get conflicts.

>> And a few things from master, the continuous development branch:
>> =C2=A0 - atari mouse/keyboard fixes (are they complete? IIRC not yet=
)
>
> There's a bit of Eiffel emulation code missing (mouse wheel IIRC) tha=
t I could
> not test on ARAnyM at that time. My development tree has the necessar=
y bits
> already, I just need to test them. The mouse driver (input driver par=
t) looks
> incredibly messy as a result of all this, and could need a review.

IIRC, there were still some other problems with the version I have, whe=
n I last
tried on ARAnyM. Don't remember the details, I'll have to dig into my
mail archive.

>> If you (talking to `owners' of the stuff on the big topic branches n=
ow ;-) think
>> something is finished and ready for upstream, I can squash the commi=
ts together
>> using `git rebase -i' and submit them upstream...
>
> Hint, hint ... what's the policy regarding driver duplication these d=
ays?

Avoid it. Extract the common part. I guess you mean for scc?

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
