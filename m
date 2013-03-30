From: =?UTF-8?Q?Ingo_J=C3=BCrgensmann?= <ij@2012.bluespice.org>
Subject: Re: [PATCH 00/11] Atari Ethernet/USB patch series - for upstream
 and debian-kernel
Date: Sat, 30 Mar 2013 01:00:46 +0100
Message-ID: <670fbbcf44fecccc2e7c66ebfcdb4d19@muaddib.hro.localnet>
References: <5152996E.50800@gmail.com>
 <20130328211747.GA10917@chumley.earth.sol> <5154C5E0.3040608@gmail.com>
 <20130328231039.GA14587@chumley.earth.sol>
 <CAMuHMdWxCW0Gp8jYYk7R3WDJ8u-LJBZJ5d9jjaPAf27vXv3jDA@mail.gmail.com>
 <20130329080629.GB14587@chumley.earth.sol>
 <CAMuHMdXcy8Apvm58m4XudxfRTRa9aiTojRVanPtY3M=mTUUxqg@mail.gmail.com>
 <5155E1A3.7060307@gmail.com> <20130329193323.GD14587@chumley.earth.sol>
 <Pine.BSM.4.64L.1303292135220.3992@herc.mirbsd.org>
 <20130329224731.GA22830@chumley.earth.sol> <5156229B.7030606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vserv.windfluechter.net ([178.63.83.104]:34760 "EHLO
	vserv.windfluechter.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757267Ab3C3ABF (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 29 Mar 2013 20:01:05 -0400
In-Reply-To: <5156229B.7030606@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Thorsten Glaser <tg@mirbsd.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Wouter Verhelst <w@uter.be>, linux-m68k@vger.kernel.org

On 2013-03-30 00:24, Michael Schmitz wrote:

> Generic questions first - what is the best strategy to make Zorro
> boards work with platform device utilizing drivers?
> Should I go and add code to amiga/platform.c to enumerate all Zorro
> devices and add platform devices for those,
> or revert to looking up Zorro device data in the SCSI driver probe
> function? Geert?
> I've seen the following output on elgar:
> schmitz@elgar:~$ cat /proc/bus/zorro/devices
> 00    21400c00    00e90000    00010000    d1
> 01    0877c900    00ea0000    00010000    c1
> The 21400c00 is product code I presume - what's the d1?  Which of the
> two is the SCSI board?

That's easy to answer:

elgar:~# lszorro -vv
00: Phase 5 Blizzard 1220/CyberStorm [Accelerator and SCSI Host 
Adapter]
         Type: Zorro II
         Address: 00e90000 (00010000 bytes)
         Serial number: 00000000
         Slot address: 00e9
         Slot size: 0001

01: Village Tronic Ariadne [Ethernet Card and Parallel Ports]
         Type: Zorro II
         Address: 00ea0000 (00010000 bytes)
         Serial number: 01001091
         Slot address: 00ea
         Slot size: 0001

;-)


>> The kernels I am building are not for official use, only for testing 
>> of new
>> patches. In the long run I want to understand how the offical Debian 
>> images
>> are built again, but unfortunately my vacation comes to an end and 
>> the new
>> semester is starting... it will be at least a month before I will 
>> have time
>> to study the Debian processes again. I may try to get crest running 
>> again
>> with the IDE disk before that.
> If you do - what SCSI board does crest use? Can you test kernels or
> possibly just modules there for me?

Crest is using the same card as Elgar, IIRC: Cyberstorm Mk1
Christian, please correct me if I'm wrong.

-- 
Ciao...          //    Fon: 0381-2744150
.     Ingo     \X/     http://blog.windfluechter.net

gpg pubkey: http://www.juergensmann.de/ij_public_key.
