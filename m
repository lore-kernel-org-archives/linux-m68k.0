From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 00/11] Atari Ethernet/USB patch series - for upstream
 and debian-kernel
Date: Sat, 30 Mar 2013 07:46:59 +1300
Message-ID: <5155E1A3.7060307@gmail.com>
References: <1364193464-3890-1-git-send-email-schmitz@debian.org> <Pine.BSM.4.64L.1303251751380.27649@herc.mirbsd.org> <51515889.6040106@uter.be> <5152996E.50800@gmail.com> <20130328211747.GA10917@chumley.earth.sol> <5154C5E0.3040608@gmail.com> <20130328231039.GA14587@chumley.earth.sol> <CAMuHMdWxCW0Gp8jYYk7R3WDJ8u-LJBZJ5d9jjaPAf27vXv3jDA@mail.gmail.com> <20130329080629.GB14587@chumley.earth.sol> <CAMuHMdXcy8Apvm58m4XudxfRTRa9aiTojRVanPtY3M=mTUUxqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:44393 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756282Ab3C2SrI (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 29 Mar 2013 14:47:08 -0400
Received: by mail-pb0-f46.google.com with SMTP id uo1so361529pbc.33
        for <linux-m68k@vger.kernel.org>; Fri, 29 Mar 2013 11:47:08 -0700 (PDT)
In-Reply-To: <CAMuHMdXcy8Apvm58m4XudxfRTRa9aiTojRVanPtY3M=mTUUxqg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wouter Verhelst <w@uter.be>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org, Ingo J?rgensmann <ij@2012.bluespice.org>

Christian,
>> in the patches at first glance, only this, which makes me shiver:
>>
>> +       ret = hid_add_device(hid_dev);
>> +       if (ret)
>> +               goto probe_err1;
>>
>> Reminds me of fortran, are gotos legal in kernel source?
> Nope, that's fine.
Explicitly allowed (and preferred) for that purpose (and a few select 
other uses).
Nesting of if () else () branches for error unwinding would otherwise 
look silly.

There's still some Real Programmers (Tm) out there :-)

Cheers,

     Michael
