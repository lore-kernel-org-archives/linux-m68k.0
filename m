From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: Kernel sections loosing attributes
Date: Fri, 8 Nov 2013 20:58:44 +1300
Message-ID: <9a3cdbb0e7e6a1deb0a85905b967bd01@biophys.uni-duesseldorf.de>
References: <CAMuHMdXsYFw6NR1BRfAEW8GYoQqUFsH5N-oSB7TxHYn8jRGCZg@mail.gmail.com> <CAMuHMdXrkSnswAr+0corHPO3fv9mtmwBxxsy7t0p=MK40hbC7w@mail.gmail.com> <a20610c002caef02061373fe70e59b01@biophys.uni-duesseldorf.de> <CAMuHMdWXDXYnx7J=EOpOQS0M2-roZof=iekYJ4F5xMxyYC7GHQ@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWXDXYnx7J=EOpOQS0M2-roZof=iekYJ4F5xMxyYC7GHQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>

Hi Geert,

>> loosely related - when did vmlinux.lds last change? I have seen 
>> messages to
>
> 17 months ago (the m68k part).
>
>> the effect that .init_end is not in a sectiion in my last attempts to 
>> build
>> 3.10 kernels (both for Atari and Amiga).
>
> Strange. Can you send me kernel and .config by private email?

Not so strange - I had dropped a patch fixing up end of kernel 
alignment problems with old binutils (see PM). With that patch, it 
boots fine.

>
>> I had been using a patched version of vmlinux.lds to add extra 
>> explicit
>> alignment at the end to pad the last section out to a page boundary
>> (binutils 2.16 is even more horribly broken than 2.18 potentially 
>> is), but
>> changes to vmlinux.lds appear to have defeated that.
>
> For cross-compiling, you can also try (ia32 version available as well):
> https://www.kernel.org/pub/tools/crosstool/files/bin/x86_64/4.6.3/
> These should work.

Thanks - these look precisely what I need.

>
>> Now that you have got tglx' attention in regards to the interrupt 
>> polling, I
>> would certainly be willing to test his patch. 3.10 won't boot - how 
>> far back
>> do I have to go?
>
> Happily running 3.12 here.

I'll stick to 3.10 for  now - should be a simple matter of setting the 
new flag and switching the handler now.

Cheers,

	Michael
