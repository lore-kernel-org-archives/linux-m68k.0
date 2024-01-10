Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D2DDDD5
	for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jan 2024 05:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=landley.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=landley-net.20230601.gappssmtp.com header.i=@landley-net.20230601.gappssmtp.com header.b="X5rKrOl3"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-429b46135d0so1643051cf.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 09 Jan 2024 21:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20230601.gappssmtp.com; s=20230601; t=1704865251; x=1705470051; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wl6KplL8vfqqzv9XIvHtOm+qlgn0/YVCH+xMxC333j8=;
        b=X5rKrOl3oTD5T5MusexhkgmGMR/iOli76AYSJCHsuXi71l+DEQo8LU3sHfruznGj2A
         p20+SBn9ttS3k5UYPK2U7YJO/YOIX8B8yEwRB9VdbsfWPWb1X3I+CKsVs8EvvorllYcl
         /9R1HFIBAr+bOoFMySyZZ+YH+b7CjZn/Znltd9K7vhcrm9496qGSXmptP60SsWTPVKsb
         yAAjvK1J5oATXk/O3hqfLkidM6arZLYS1hxxdgNAkpAR69sGJjw7+u/hVoc4CdftXGzb
         cqql1FiDii1WMb/cyDa4Dkw4veFnx4AMUA1gbLji6ocglhoa1o2ikufZNu1FC4hBa6tB
         gIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704865251; x=1705470051;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wl6KplL8vfqqzv9XIvHtOm+qlgn0/YVCH+xMxC333j8=;
        b=CaSM4HnZBqNMwwbXvou1PYWAl9XARiicZkPhE07kQjORjPDs25bzvoIGfDdsFxxgO9
         KUsXlOLyb39+BWQupoPq7AsZht4h5IWJVtUUNtfNasb99xDZ4FdiyFrVRppDN5ZTGRX2
         cEzUC87u8U7wAPCEd3nZHGD18oEEQuxPQ9ja69HJ1vF8cTQaMJj18uSWpHGJvQVuEiSd
         +gWHgmjEx1bBwmqrm7ENNgG4z510mjP7VQwSZyd0ld9D9vghAeal/HaXM1OUddJdpVYE
         0Th7rm7QUa70OhV3aopqt/pZTCyteM+Sfe/bceEtZHQCxu7dLW5FXLcO1usR4BicoBi9
         OFbw==
X-Gm-Message-State: AOJu0YxjJuPAXi6hljSOK1qtWokPNkG7O1DuoE+8nd4fn6hziHfMJFSP
	yM4ZaKgucXS/wecXE6QatUajWk1MKW1mug==
X-Google-Smtp-Source: AGHT+IE8kWehfow24cvasfCahOteXRnQwmSQ0KUU70I6cj4jEzLcuNUg6AgxZgtVGm7CpYkCj/gbDA==
X-Received: by 2002:a05:622a:588:b0:429:b76a:c3fa with SMTP id c8-20020a05622a058800b00429b76ac3famr202269qtb.26.1704865251286;
        Tue, 09 Jan 2024 21:40:51 -0800 (PST)
Received: from [172.16.32.83] ([198.232.126.202])
        by smtp.gmail.com with ESMTPSA id cr14-20020a05622a428e00b0042997333149sm1497591qtb.63.2024.01.09.21.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 21:40:51 -0800 (PST)
Message-ID: <b3a8b9db-86ee-47c6-96e2-baa2cba61404@landley.net>
Date: Tue, 9 Jan 2024 23:47:27 -0600
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Call for nommu LTP maintainer [was: Re: [PATCH 00/36] Remove
 UCLINUX from LTP]
Content-Language: en-US
To: Greg Ungerer <gerg@linux-m68k.org>, Petr Vorel <pvorel@suse.cz>
Cc: Cyril Hrubis <chrubis@suse.cz>, Geert Uytterhoeven
 <geert@linux-m68k.org>, ltp@lists.linux.it, Li Wang <liwang@redhat.com>,
 Andrea Cervesato <andrea.cervesato@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Christophe Lyon <christophe.lyon@linaro.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 automated-testing@lists.yoctoproject.org, buildroot@buildroot.org,
 Niklas Cassel <niklas.cassel@wdc.com>
References: <20240103015240.1065284-1-pvorel@suse.cz>
 <CAMuHMdXGwyS-CL0vLdUP4Z4YEYhmcmDyC3YdGCnS=jFkqASqvw@mail.gmail.com>
 <20240103114957.GD1073466@pevik>
 <CAMuHMdX0s0gLRoPtjJmDnSmZ_MNY590dN+JxM1HKAL1g_bjX+w@mail.gmail.com>
 <ZZVOhlGPg5KRyS-F@yuki> <5a1f1ff3-8a61-67cf-59a9-ce498738d912@landley.net>
 <20240105131135.GA1484621@pevik>
 <90c1ddc1-c608-30fc-d5aa-fdf63c90d055@landley.net>
 <20240108090338.GA1552643@pevik>
 <a3d7f5ae-56c6-9cd8-2cda-2d50d12be9c4@landley.net>
 <461a6556-8f24-48f5-811a-498cb44f2d64@linux-m68k.org>
From: Rob Landley <rob@landley.net>
In-Reply-To: <461a6556-8f24-48f5-811a-498cb44f2d64@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/9/24 17:17, Greg Ungerer wrote:
> 
> On 10/1/24 06:24, Rob Landley wrote:
>> On 1/8/24 03:03, Petr Vorel wrote:
>>> Hi Rob, all,
>>>
>>> [ Added Niklas Cassel, who is maintainer of qemu_riscv64_nommu_virt_defconfig in
>>> buildroot ]
>> 
>> Hi Niklas!
>> 
>>>> Buildroot also apparently has an LTP package selectable in menuconfig:
>>>
>>>> https://github.com/buildroot/buildroot/tree/master/package/ltp-testsuite
>>>
>>>> But I haven't tried it...
>>>
>>> I'm the maintainer of the LTP package in buildroot in my private time.
>>> BTW I spent quite a lot of time fixing LTP (and some other system packages,
>>> e.g. nfs-utils) compilation on some old legacy architectures reported via
>>> http://autobuild.buildroot.net/ I've never used in the reality.
>>> But I certainly don't have time to drive nommu support in my private time.
>>> I don't even have an interest, I don't use any nommu device.
>> 
>> I do, but I've never done much with LTP, and I have my hands full with toybox
>> and mkroot already.
>> 
>>> Therefore nobody who is not involved in nommu will not find a time to support it
>>> in LTP (support does not mean just to add the functionality to the new C API,
>>> but run tests on nommu and fix failing bugs). I suppose nobody is paid to work
>>> on nommu platforms, it would have to be a hobby project, right?
>> 
>> A bunch of people are paid to work on nommu platforms, and I've worked with them
>> a bunch, but none of them talk to linux-kernel. They find the culture toxic,
>> insular, and categorically dismissive of their interests.
> 
> I have been involved in the kernel nommu space for 20 years, and sure, there is
> some of that. But mostly spending some time and effort to get involved pays off.
> I have seen potential contributors show up with some arrogant attitudes too,
> so it cuts both ways here.
> 
> The m68k community I have been part of has been nothing but welcoming. The mm
> people have tried hard to keep nommu support up-to-date where almost none of them
> actually have a vested interest in doing so.
> 
> What I have seen is that many companies working in this space just don't want
> to spend the time and effort to go mainline.

Sometimes they don't bother. Sometimes there's a language barrier. Sometimes
they can't get anything newer than 2.6 working because that's the BSP they were
given so what's the point of trying to engage upstream? Sometimes they think
it's their upstream vendor's responsibility. Sometimes they poke their head up
and get it bit off ala http://landley.net/notes-2008.html#11-12-2008 and then
that serves as a warning to others for generations. Sometimes the company's
legal department thinks it's a terrible idea to attract attention from people
like the SFLC. And sometimes...


The SmartFusion 2 project I was doing on cortex-m was for a project that was to
be launched into space on a NASA rocket, and thus fell under ITAR export
regulations (as the entire US space program has since 1996 due to
https://en.wikipedia.org/wiki/International_Traffic_in_Arms_Regulations#:~:text=Intelsat
) and my manager explained it to me as:

"If I buy a screwdriver from Home Depot, it's just a screwdriver. If I use it to
turn a screw on a spacecraft it is now a munition and cannot be discussed with
non-US persons".

The stupid linked above was:

1) cryptography was categorized as a munition until Bill Clinton relaxed it via
executive order, because 56 bit https was preventing anybody from trusting the
web with their credit card data.

2) Before that, in 1996, china wanted to launch a satellite into space with
crypto stuff so they negotiated with the USA to get some cryptographic hardware
which was delivered/installed under armed guard and escorted to the launch pad.

3) The rocket blew up on launch, scattering debris over a chinese city (becuase
of COURSE china's rocket launches go over large population centers). The crypto
hardware was never recovered.

4) It became a scandal. Congress freaked. And somehow in the scuffle ITAR export
regulations were extended from cryptography to the entire US space program.

5) The US space program dried up and blew away, as engineers had to choose
between "I can work on space stuff" and "I can have any sort of professional
network online". (Because who online is a "non-US person"? That includes canada.
You can't discuss ITAR subjects with canadians. Or foreign nationals living in
the USA. You couldn't ask Alan Cox a question about an ITAR project.)

So that's a whole category that stays very quiet about what they do, and whose
legal analysis of the GPL is "we're making 3 of these and shooting them into
space, if you retrieve one from space and demand source code from us we will
forward you to the relevant federal agencies, and there's a nonzero chance
you'll be on a black site in Diego Garcia within 24 hours where they will figure
out how you did that. Or maybe you'll get the code. Who knows?"

Me, I try to avoid that kind of contract...

> That is a business decision they
> make, and that is fine. Heck my work in actual mainline has never really been
> paid for by any company and I have sunk a _lot_ of time into it. (Full disclosure
> I did get paid to work on early porting and support - just not geting it into
> mainline and maintain it there).

The thing is if you post something _once_ it gets ignored, and if you follow-up
long enough for it to go in (which often takes years), it will then get ripped
out again a few years later because "we never hear from anybody who uses this".

Engaging with the community is signing up for an ongoing commitment.

>> For example, cortex-m is a large nommu platform on which vendors support Linux
>> BSPs, but notice how page 8 of
>> https://www.microsemi.com/document-portal/doc_view/132181-linux-cortex-m-users-manual
>> points at a cross compiler toolchain from _2010_ and page 4 says they're booting
>> a 2.6.33 kernel?
> 
> Any company/person who follows the route of not working with the linux kernel
> community to get their work included is going to inevitably get stuck on older
> versions of everything.

I fight hard to get current versions of everything to work on all my supported
targets. This requires regular regression testing, and I maintain a pile of
patches that I post here periodically but I fully admit will probably never go in:

  https://lkml.iu.edu/hypermail/linux/kernel/2302.2/05594.html

(Sigh, now that 6.7 is out I should post the new round...)

People who want to use my kernels as a source are welcome to do so (and I've
seen my patches quietly show up in other projects), but getting upstream to
actually _fix_ anything? Every one of those patches had a link to the previous
time it was posted to the list and ignored.

I mean literally, the first of those patches teaches the makefile to autodetect
whether $PREFIX-cc is gcc or llvm and just do the right thing, and I was told
that they actively didn't want it to:

https://lkml.iu.edu/hypermail/linux/kernel/2302.2/07184.html

That is modern linux-kernel development.

>> I'm a bit weird in that I try to get CURRENT stuff to work on nommu, and a lot
>> of people have been happy to consume my work, but getting any of them to post
>> directly to linux-kernel is like pulling teeth.
> 
> I regularly test nommu configurations (as in every kernel rc and release) on m68k
> and at least every release on other architectures like arm(*) and recently on
> riscv as well.

Sigh, I should start caring about riscv. I added or1k support, I should do
riscv. (Except I did or1k because I found it in actual hardware, the Orange Pi
3b's power controller is an or1k asic so I needed an or1k toolchain to build
some of u-boot's firmware or else the board couldn't reboot, and there was a
qemu-system-or1k already, which turned into adding it to mkroot via a long
https://lore.kernel.org/openrisc/ZX1xbs_AGdgLgcx7@antec/ thread with its
developers. Alas I still can't get qemu to exit (I.E. virtually reboot or power
off), apparently I need to reinstall my laptop to have a new enough version of
python 3 to build a newer qemu with. It's on the todo list...)

I still have a hard time considering riscv anything other than open source's
version of Itanium. Promises of ubiquity, but even a 28 nanometer mask is still
6 figures before you run any wafers and your mask build process is sucking in
all the black box libraries the fab can sell you, so what does "open" really get
you here? Cortex-m got cheap when the superh patents expired so Arm didn't have
to pay royalties to hitachi (renesas?) for the thumb instruction set anymore,
and they belt those suckers en masse amortizing the up-front costs over ENORMOUS
volume.

And yes, j-core was trying to fix the closed source library and toolchain issues
back when I was still working with them. Among other things fishing
Google/skywater's openlane toolchain build out of their magic docker and
reproducing it under a vanilla debootstrap, ala
https://github.com/j-core/openlane-vhdl-build (As with most corporate
clusterfscks, once you dig far enough it turns out you can throw over 90% of it
out...)

But these days I'm trying to get toybox to 1.0...

> (*) somewhat annoyingly needing a minor patch to run the versatile qemu platform
>      I like to test with. But hey, that is on me :-)

I would very much like to add more nommu targets to mkroot, can I get your
build/config info offline? (I tried fishing configs out of buildroot a couple
years ago, but after the THIRD one where the secret was "use very old versions
of packages, the current stuff is broken"... And the problems were things like
"the conversion to device tree deleted a huge chunk of this infrastructure", not
simple fixes.)

> Regards
> Greg

Rob
