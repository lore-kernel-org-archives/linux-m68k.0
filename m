From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Aranym, more than 244MB FastRAM, garbled display
Date: Mon, 11 Oct 2010 10:00:58 +0200
Message-ID: <AANLkTikumgbPW12gcsUML-JqyCUUaws2=r1gY7NT4fgJ@mail.gmail.com>
References: <alpine.LNX.2.00.1010011728270.4788@halbrend.uninett.no>
	<m2tyl5u9hu.fsf@igel.home>
	<alpine.LNX.2.00.1010011908550.4788@halbrend.uninett.no>
	<Pine.BSM.4.64L.1010041947160.3776@herc.mirbsd.org>
	<AANLkTinq7CXPpYVfAYhgH9ea1FQs_f+AhYsU1-+ZdUx+@mail.gmail.com>
	<Pine.BSM.4.64L.1010060910520.21623@herc.mirbsd.org>
	<AANLkTi=ZrDoFPxFNZ3OKurvcrBuN3fS0gTvAeYpLQqCi@mail.gmail.com>
	<AANLkTin+_c=Luvns2MYkVhBksB8vD3reDh8W6a8Bje2o@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:62666 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752648Ab0JKIKv (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 11 Oct 2010 04:10:51 -0400
Received: by wwj40 with SMTP id 40so3457112wwj.1
        for <linux-m68k@vger.kernel.org>; Mon, 11 Oct 2010 01:10:50 -0700 (PDT)
In-Reply-To: <AANLkTin+_c=Luvns2MYkVhBksB8vD3reDh8W6a8Bje2o@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

Hi Geert,

>> BTW: browsing Geert's git tree online, I noticed that my old patch to
>> reserve some of ST-RAM for use by atafb etc. has never made it into
>
> That's correct.
>
>> git. I'll clean that up and resubmit unless Geert has objections.
>
> I'm blocked on this follow-up you sent me afterwards (without CC to the list):
>
> | Plus there's still a bug in stram_free_block, let's see if you can spot it :-)

Does not ring any bells ... I'll check my old mbox as soon as I have
access again. I'll add a kernel parameter as well.

Cheers,

  Michael
