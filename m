From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: Zero Divide in Kernel 3.12-rc4
Date: Mon, 4 Nov 2013 19:33:45 +1300
Message-ID: <aa2e338df898655dc44552566149129a@biophys.uni-duesseldorf.de>
References: <dbbdc369c25c9eea7abc4ca331128de3@muaddib.hro.localnet> <f8389c591d50fe216b546e70d464c1f9@biophys.uni-duesseldorf.de> <CAMuHMdVfvDAuqpTFFq5qQK2Prio55i2bmcne-eu_VQt5xFY-LQ@mail.gmail.com> <335d2ba0b0b19e56b2880882a1c4c543@biophys.uni-duesseldorf.de> <9f57bf0fdf7329055ee5f7d2b2fe966d@biophys.uni-duesseldorf.de> <5cbf031e8c962394a34615d18977f609@muaddib.hro.localnet> <b3074c40e5912f4260968bc02276f356@biophys.uni-duesseldorf.de> <A97EB404-8FFB-45C0-8ABF-D811B415A46A@2013.bluespice.org>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f45.google.com ([209.85.160.45]:40316 "EHLO
	mail-pb0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750760Ab3KDGeA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Nov 2013 01:34:00 -0500
Received: by mail-pb0-f45.google.com with SMTP id ma3so6746095pbc.18
        for <linux-m68k@vger.kernel.org>; Sun, 03 Nov 2013 22:33:59 -0800 (PST)
In-Reply-To: <A97EB404-8FFB-45C0-8ABF-D811B415A46A@2013.bluespice.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?ISO-8859-1?Q?Ingo_J=FCrgensmann?= <ij@2013.bluespice.org>
Cc: tuomas.vainikka@kopteri.net, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

Ingo,

>
>> any further news on this one?
>
> Well, not really, I think... but this might be good news. ;)

Indeed - at the very least it shows it is a rare error.

>
> Yesterday there were two media sense errors on /dev/sda on Spice 
> (A3000/040 with Warpengine, so no ESP), but I guess that's a real 
> media error, especially because sda2 is an AFFS partition I had 
> mounted.

That does look like a bad disk block, yes. Might be time for a backup.

Cheers,

	Michael


>
> Nov  2 02:03:29 spice kernel: [629303.810000] sd 1:0:0:0: [sda] 
> Unhandled sense code
> Nov  2 02:03:29 spice kernel: [629303.820000] sd 1:0:0:0: [sda]
> Nov  2 02:03:29 spice kernel: [629303.830000] Result: hostbyte=DID_OK 
> driverbyte=DRIVER_SENSE
> Nov  2 02:03:29 spice kernel: [629303.840000] sd 1:0:0:0: [sda]
> Nov  2 02:03:29 spice kernel: [629303.850000] Sense Key : Medium Error 
> [current]
> Nov  2 02:03:29 spice kernel: [629303.880000] Info fld=0x7b1d0
> Nov  2 02:03:29 spice kernel: [629303.890000] sd 1:0:0:0: [sda]
> Nov  2 02:03:29 spice kernel: [629303.900000] Add. Sense: Unrecovered 
> read error
> Nov  2 02:03:29 spice kernel: [629303.910000] sd 1:0:0:0: [sda] CDB:
> Nov  2 02:03:29 spice kernel: [629303.920000] Read(10): 28 00 00 07 b1 
> d0 00 00 01 00
> Nov  2 02:03:29 spice kernel: [629303.970000] end_request: critical 
> medium error, dev sda, sector 504272
> Nov  2 02:03:30 spice kernel: [629303.980000] Buffer I/O error on 
> device sda2, logical block 240944
> Nov  2 02:03:30 spice kernel: [629306.740000] sd 1:0:0:0: [sda] 
> Unhandled sense code
> Nov  2 02:03:30 spice kernel: [629306.750000] sd 1:0:0:0: [sda]
> Nov  2 02:03:30 spice kernel: [629306.760000] Result: hostbyte=DID_OK 
> driverbyte=DRIVER_SENSE
> Nov  2 02:03:30 spice kernel: [629306.770000] sd 1:0:0:0: [sda]
> Nov  2 02:03:30 spice kernel: [629306.780000] Sense Key : Medium Error 
> [current]
> Nov  2 02:03:30 spice kernel: [629306.800000] Info fld=0x17c220
> Nov  2 02:03:30 spice kernel: [629306.810000] sd 1:0:0:0: [sda]
> Nov  2 02:03:30 spice kernel: [629306.820000] Add. Sense: Unrecovered 
> read error
> Nov  2 02:03:30 spice kernel: [629306.830000] sd 1:0:0:0: [sda] CDB:
> Nov  2 02:03:30 spice kernel: [629306.840000] Read(10): 28 00 00 17 c2 
> 20 00 00 01 00
> Nov  2 02:03:30 spice kernel: [629306.890000] end_request: critical 
> medium error, dev sda, sector 1557024
> Nov  2 02:03:30 spice kernel: [629306.900000] Buffer I/O error on 
> device sda2, logical block 1293696
> Nov  2 02:03:30 spice kernel: [629309.590000] sd 1:0:0:0: [sda] 
> Unhandled sense code
> Nov  2 02:03:31 spice kernel: [629309.600000] sd 1:0:0:0: [sda]
> Nov  2 02:03:31 spice kernel: [629309.610000] Result: hostbyte=DID_OK 
> driverbyte=DRIVER_SENSE
> Nov  2 02:03:31 spice kernel: [629309.620000] sd 1:0:0:0: [sda]
> Nov  2 02:03:31 spice kernel: [629309.630000] Sense Key : Medium Error 
> [current]
> Nov  2 02:03:31 spice kernel: [629309.650000] Info fld=0x7b1d0
> Nov  2 02:03:31 spice kernel: [629309.660000] sd 1:0:0:0: [sda]
> Nov  2 02:03:31 spice kernel: [629309.670000] Add. Sense: Unrecovered 
> read error
> Nov  2 02:03:31 spice kernel: [629309.680000] sd 1:0:0:0: [sda] CDB:
> Nov  2 02:03:31 spice kernel: [629309.690000] Read(10): 28 00 00 07 b1 
> d0 00 00 01 00
> Nov  2 02:03:31 spice kernel: [629309.740000] end_request: critical 
> medium error, dev sda, sector 504272
> Nov  2 02:03:31 spice kernel: [629309.760000] Buffer I/O error on 
> device sda2, logical block 240944
> Nov  2 02:03:31 spice kernel: [629312.540000] sd 1:0:0:0: [sda] 
> Unhandled sense code
> Nov  2 02:03:31 spice kernel: [629312.550000] sd 1:0:0:0: [sda]
> Nov  2 02:03:31 spice kernel: [629312.560000] Result: hostbyte=DID_OK 
> driverbyte=DRIVER_SENSE
> Nov  2 02:03:31 spice kernel: [629312.570000] sd 1:0:0:0: [sda]
> Nov  2 02:03:31 spice kernel: [629312.580000] Sense Key : Medium Error 
> [current]
> Nov  2 02:03:31 spice kernel: [629312.610000] Info fld=0x17c220
> Nov  2 02:03:31 spice kernel: [629312.620000] sd 1:0:0:0: [sda]
> Nov  2 02:03:31 spice kernel: [629312.630000] Add. Sense: Unrecovered 
> read error
> Nov  2 02:03:31 spice kernel: [629312.640000] sd 1:0:0:0: [sda] CDB:
> Nov  2 02:03:32 spice kernel: [629312.650000] Read(10): 28 00 00 17 c2 
> 20 00 00 01 00
> Nov  2 02:03:32 spice kernel: [629312.700000] end_request: critical 
> medium error, dev sda, sector 1557024
> Nov  2 02:03:32 spice kernel: [629312.720000] Buffer I/O error on 
> device sda2, logical block 1293696
>
> Otherwise it looks good. No appearance of "Whoa" so far:
>
> spice:/home/ij# zgrep -i whoa /var/log/syslog* /var/log/messages*
> spice:/home/ij#
>
> akire:~# zgrep -i whoa /var/log/syslog* /var/log/messages*
> akire:~#
>
> I would like to stress akire a little more with a running buildd, but 
> Aurelien didn't add Spice & Akire yet to w-b the last two weeks...
>
> -- 
> Ciao...            //      Fon: 0381-2744150
>       Ingo       \X/       http://blog.windfluechter.net
>
>
> gpg pubkey:  http://www.juergensmann.de/ij_public_key.asc
>
