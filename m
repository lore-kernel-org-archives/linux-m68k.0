From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [RFC 1/2] nubus: Remove slot zero probe
Date: Sun, 30 Apr 2017 19:45:40 +1200
Message-ID: <1fe7389e-d574-24ae-b0b2-737320ac5aff@gmail.com>
References: <cover.1492910474.git.fthain@telegraphics.com.au>
 <784e96fea94d1cb000d86af9bf8553ddd1adbb97.1492910474.git.fthain@telegraphics.com.au>
 <2e0f3b4b-a4e3-6cf8-696c-cefbd2c15f37@gmail.com>
 <alpine.LNX.2.00.1704251427450.1686@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:36537 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1167087AbdD3Hpr (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 30 Apr 2017 03:45:47 -0400
Received: by mail-pg0-f67.google.com with SMTP id v1so11786876pgv.3
        for <linux-m68k@vger.kernel.org>; Sun, 30 Apr 2017 00:45:47 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1704251427450.1686@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "linux-m68k@vger.kernel.org >> Linux/m68k" <linux-m68k@vger.kernel.org>

Hi Finn,

I don't think anyone would want to replace the macintosh_config struct
with something based on the mainboard ROM data (or ROM data plus
hardcoded model info) at this time. So this code can truly go. Thanks
for making the effort to clean up this code.

Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>

Am 25.04.2017 um 17:19 schrieb Finn Thain:
> 
> On Tue, 25 Apr 2017, Michael Schmitz wrote:
> 
>> Hi Finn,
>>
>> what would the onboard ROM resources be potentially used for? Something 
>> that's not in the config struct or can't be added there because no one 
>> remembers how to build the Penguin booter?
>>
> 
> The hardware specs in the Mac bootinfo data are basically ignored by the 
> kernel. So I think the issue is stuff that's not in the config struct and 
> can't be inferred from the gestalt ID at all. (The macintosh_config struct 
> hinges on the gestalt ID.)
> 
> The bootinfo data should offer a normal gestalt ID... assuming the 
> bootloader can obtain one. Theoretically EMILE could be used with a Mac 
> ROM so old that the _Gestalt trap gives the wrong answer, or is simply 
> not available...
> https://www.fenestrated.net/mac/mirrors/Apple Technotes (As of 2002)/ov/ov_16.html
> 
> I strongly suspect that such machines have no slot zero ROM anyway. And 
> this doesn't apply to Penguin at all, since it can assume System 7.1 and 
> therefore it can get a correct gestalt ID.
> 
> The real problem is, even if the slot zero ROM tells you (say) the VRAM 
> size on one model, a different model might not put that information there. 
> And if we want to handle both cases, why bother with the slot zero ROMs at 
> all?
> 
>> Seeing as the original code (that this patch reverts to) was used while 
>> the Mac port was more widely in use and tested argues strongly in favour 
>> of accepting this patch.
> 
> Right.
> 
> Another strong argument stems from all of the hacks (see below) around the 
> various flaws in the various ROMs. If a large number of Mac models need 
> special workarounds for flaws in their ROMs, you might as well just 
> describe the various exceptions in an array of structs, indexed by gestalt 
> ID number ... which is to reinvent the macintosh_config struct.
> 
>> Whoever wants to ever revive this code will find it in the git 
>> history...
>>
> 
> Or the CVS history, since the decision to remove this code was made there 
> too (many years ago).
> 
