From: Tuomas Vainikka <tuomas.vainikka@aalto.fi>
Subject: Re: watchdog (?) on linux 3.0.0 and 2.6.39.3
Date: Mon, 8 Aug 2011 13:52:28 +0300
Message-ID: <4E3FBFEC.5070404@aalto.fi>
References: <4E369834.9070707@aalto.fi>	<alpine.OSX.2.00.1108021532260.256@ibook.intranet>	<4E3ACFE5.7020901@aalto.fi>	<CAOmrzkL1ZaWBtYG6uyotwgGzoZLEdafrUCh6qfq-_siNZ9vvdQ@mail.gmail.com>	<4E3BD9C1.6020209@aalto.fi>	<4E3C6F8D.7030902@gmail.com>	<CAMuHMdXeFH-uTw5XWB4_arvj2DfbXrb4q_9BKKhDhxNxwFvmBw@mail.gmail.com>	<CAOmrzkKRP+mD8zESBHrJYxzVvj1NE4rEA+ATaaD6u4BJOQyV6Q@mail.gmail.com>	<20110807220744.GA5199@chumley.earth.sol> <CAOmrzkK=3e724KQPCWFckxSzm3eYL86f0VnY4vv-AVKRYPevmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAOmrzkK=3e724KQPCWFckxSzm3eYL86f0VnY4vv-AVKRYPevmQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>

On 08/08/2011 03:23 AM, Michael Schmitz wrote:
> Hi Christian,
>
>>> Christian - can you remember which 2.6 kernel that last had ethernet
>>> working for you?
>> I haven't been testing kernels a lot recently... from the logfiles it would
>> seem the last kernel that was running on kullervo was this one:
>>
>> Linux version 2.6.24-1-amiga (Debian 2.6.24-4) (waldi@debian.org) (gcc version 3.3.6) #1 Tue Feb 12 10:05:37 CET 2008
>>
>> I think the kernel from Stephens d-i image was working also, but I have not
>> tested that intensively, only for installing from scratch. In May I wrote
>> this was:
>>
>> Linux kullervo 2.6.26-1-amiga #1 Thu Oct 16 08:59:25 CDT 2008 m68k GNU/Linux
> Thanks, I'll look up the likely commit to start from using 2.6.24
> then. I have the .config Tuomas used for his kernel - do you need any
> modules built as well, Tuomas?
>
>
I believe that with the .config I provided none of the modules are 
obligatory, but the IDE and floppy modules would be nice, since, as you 
pointed out, the watchdog barks once they are probed.
You could also go for amiga_defconfig with built-in apne and nfsroot.

Regards,
Tuomas
