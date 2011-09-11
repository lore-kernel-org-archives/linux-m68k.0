From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: 68000 patches (Atari ST platform)
Date: Mon, 12 Sep 2011 11:26:32 +1200
Message-ID: <CAOmrzk+sqAzh48zXOKQ06iRhceJMTZvPJiDDTASgmT1Qv1B-7Q@mail.gmail.com>
References: <20110911230920.GA1541@matze-K8NF4G-SATA2>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:46301 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753570Ab1IKX0d convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 11 Sep 2011 19:26:33 -0400
Received: by pzk37 with SMTP id 37so5905022pzk.1
        for <linux-m68k@vger.kernel.org>; Sun, 11 Sep 2011 16:26:33 -0700 (PDT)
In-Reply-To: <20110911230920.GA1541@matze-K8NF4G-SATA2>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Matthias Reis <matthias.reis@physik.tu-berlin.de>
Cc: linux-m68k@vger.kernel.org, "Christian T. Steigies" <cts@debian.org>

Hi Matthias,

On Mon, Sep 12, 2011 at 11:09 AM, Matthias Reis
<matthias.reis@physik.tu-berlin.de> wrote:
> Hi all,
>
> today I finally got my hands on the user interrupts for plain 68000 CPUs and it was quite straightforward, just as you have suggested: I implemented user*_inthandlers in entry_mm.S that push the vectornumber onto the stack. My kernel still doesn't boot completely, but it runs now correctly calibrate delay loop (0.59 BogoMIPS, isn't it great? ;) since the timer interrupt is working.

0.6 BogoMIPS sounds about right :-)

> According to the "release early, release often"-mantra, I want now to send some patches to the list. Do you want to have the Atari bootstrap patches in this mailinglist? I'm asking because bootstrap is not (anymore) part of the kernel sources... The next question would be whether you want to have a single head.S version for the Atari ST-nommu platform or a merge with the current arch/m68k/kernel/head.S. The head.S I use does not use much code from the "classic" head.S and is for sure easier to read due to its small size.

Regarding the bootstrap patches - do send them to the list, please.
Whoever does build ataboot binaries occasionally these days can then
pick up your patches.

ataboot used to be part of the m68k CVS on kullervo.debian.net but we
have had to take kullervo offline half a year ago. Christian has
rebuilt the system but we're still having trouble with the ethernet
driver in 3.1 (sort of working on this). I'm sure we can clone the
m68k CVS off kullervo and set it up somewhere else.

My preference would be to have a separate head.S if they cannot be
trivially merged. Your call, or Geert's really though.

Cheers,

  Michael
