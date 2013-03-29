From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 00/11] Atari Ethernet/USB patch series - for upstream
 and debian-kernel
Date: Sat, 30 Mar 2013 12:24:11 +1300
Message-ID: <5156229B.7030606@gmail.com>
References: <5152996E.50800@gmail.com> <20130328211747.GA10917@chumley.earth.sol> <5154C5E0.3040608@gmail.com> <20130328231039.GA14587@chumley.earth.sol> <CAMuHMdWxCW0Gp8jYYk7R3WDJ8u-LJBZJ5d9jjaPAf27vXv3jDA@mail.gmail.com> <20130329080629.GB14587@chumley.earth.sol> <CAMuHMdXcy8Apvm58m4XudxfRTRa9aiTojRVanPtY3M=mTUUxqg@mail.gmail.com> <5155E1A3.7060307@gmail.com> <20130329193323.GD14587@chumley.earth.sol> <Pine.BSM.4.64L.1303292135220.3992@herc.mirbsd.org> <20130329224731.GA22830@chumley.earth.sol>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:37553 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757290Ab3C2XYR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 29 Mar 2013 19:24:17 -0400
Received: by mail-pd0-f179.google.com with SMTP id x11so432675pdj.10
        for <linux-m68k@vger.kernel.org>; Fri, 29 Mar 2013 16:24:17 -0700 (PDT)
In-Reply-To: <20130329224731.GA22830@chumley.earth.sol>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Wouter Verhelst <w@uter.be>, linux-m68k@vger.kernel.org, Ingo J?rgensmann <ij@2012.bluespice.org>

Christian,

thanks for this - I'm sure it will come handy for building test kernel 
packages.

Generic questions first - what is the best strategy to make Zorro boards 
work with platform device utilizing drivers?
Should I go and add code to amiga/platform.c to enumerate all Zorro 
devices and add platform devices for those,
or revert to looking up Zorro device data in the SCSI driver probe 
function? Geert?

I've seen the following output on elgar:

schmitz@elgar:~$ cat /proc/bus/zorro/devices
00    21400c00    00e90000    00010000    d1
01    0877c900    00ea0000    00010000    c1

The 21400c00 is product code I presume - what's the d1?  Which of the 
two is the SCSI board?


>>> I managed to build an amiga kernel from linux-source-3.8 (in experimental)
>>> with this command:
>>>
>>> make KBUILD_DEBARCH=m68k ARCH=m68k CROSS_COMPILE=m68k-linux-gnu- deb-pkg
>> You can just run dpkg-buildpackage -am68k???
> Because linux-source, just like linux-m68k git, does not contain a debian
> directory. The linux source package (note the missing dash) does contain a
> debian directory, but that fails because gencontrol.py does not run on my
> box (OSError: missing file or directory with no hint what file is missing).
While you can catch errors of that sort in python, it's still left to 
the programmer to provide a meaningful error message.
Shame on python's subprocess.py for not printing the missing path on 
failed exec.

File "debian/bin/gencontrol.py", line 132, in do_arch_packages
     env=kw_env)


seems to be where subprocess.py is invoked - I'd add a trace print there.

>> IMHO we should try to get to as close to the normal Debian processes
>> as possible though. I???d wager a guess and say that, if you ask, for
>> example, waldi or bwh in IRC, they???d be happy to help (as opposed to
>> see you doing some n??n-standard stuff).
> The kernels I am building are not for official use, only for testing of new
> patches. In the long run I want to understand how the offical Debian images
> are built again, but unfortunately my vacation comes to an end and the new
> semester is starting... it will be at least a month before I will have time
> to study the Debian processes again. I may try to get crest running again
> with the IDE disk before that.
If you do - what SCSI board does crest use? Can you test kernels or 
possibly just modules there for me?

Cheers,

     Michael
