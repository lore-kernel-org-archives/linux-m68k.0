Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61CAEC2
	for <linux-m68k@lists.linux-m68k.org>; Sat, 10 Aug 2024 05:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723267854; cv=none; b=PPyi1XhbZ9BziCf+M458m3NfZfcBhgphbX30C4n5WEtkbrvH9/gXWExjZocLXFT+91h1uEUoIo5WHmcVsXkmBMBIRIeGsQY1XuDJvks6Jpev27dIdYwJIh+ze9AtIuXSQZQKuQCcoJ3Usbi0k6Ky2QrlI7/xKu4IEo3VFGVI5GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723267854; c=relaxed/simple;
	bh=vg9eOnctxJPRL0g4uInjQ2oSisD8/wklC9rT4C5wJW4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kP3+hV512nfxlnk7V7Vv/HdrxAss5Aw/s1UcMHfSSegqensAqBLmlt5x0E8KNDhS+cqaQXqzNbBVhO9VgtAM39eK2RYzk/m3sEiKVMtIeUHLdVawwZ1vw3S5Avxn3zAHXzjRYnoW+QiwKF6YfOgAihpVTJL8iBeh1ZR2Qv9Qnvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WUI3LvBd; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WUI3LvBd"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 7B179138FD74;
	Sat, 10 Aug 2024 01:30:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sat, 10 Aug 2024 01:30:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1723267849; x=1723354249; bh=Y9HWnqkuOhe7qZuWP9uhVUSIWfRV
	QaEv7PRFMcrKnrc=; b=WUI3LvBd2vylUuW/4E5IsVVg7nrBZMQIxxd8hoQYFvTU
	mLUgjOFdfEu4XQBdsnAyJ9WRl75HDTT2opzZrgtRyJ+PBWtAc+oLW1Jh9IJPiCnA
	T5ha9YHQQOGQkLNs4kJIZIMH4QjAywdn0jlqxl4iTKXkMaY8jUPBWrCt9LF1EppD
	YX/SDlLaOPp3XSnR4Rw8Ud8SSuw2oTawvCZrADaKuWnyEjG1Zqc1GJC/Jslc4gQI
	XlehVTV/8gTmFlDR7y9hPhl2lzgwaL/b5flgicx5iOtSoiCVcxGYXYx6TikfUj4X
	x/4/IAGs7V8UKpnHclbNPKWHNG7Miq2rBDMtGkFqyQ==
X-ME-Sender: <xms:Cfu2Zl0yRZO8mgP6sBoaBHI9nKzqZ_QZxSeYTlwstiKB7SwolTdfOw>
    <xme:Cfu2ZsEbaDu0jJHG_fNBWeLwHiKDC4x97hj0GdHxj57R2MHmrR7xqzfhUubG0wNJI
    3-BwURfjFOdyLg2qOg>
X-ME-Received: <xmr:Cfu2Zl6Pj7_eAOQ_mvSH9G7CHdmCRxfOmOe2XQMfR81uUnmNdXfabhTUIfYsuiA0hTDGi7EvvxpJy_a08n7KB-P23WkRW0DYvUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrleehgdeliecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfh
    rhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdroh
    hrgheqnecuggftrfgrthhtvghrnhepieduleefkeefueeihfelueeggefhgefghfevleej
    leevteejvdeuhfeiffduteeunecuffhomhgrihhnpehflhgrghhsrdhsohenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhi
    nhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehstghhmhhithiimhhitgesghhmrghilhdrtghomhdprhgtphht
    thhopehlihhnuhigqdhmieekkheslhhishhtshdrlhhinhhugidqmheikehkrdhorhhgpd
    hrtghpthhtohepuggvsghirghnqdeikehksehlihhsthhsrdguvggsihgrnhdrohhrghdp
    rhgtphhtthhopehushgvrhhmheejseihrghhohhordgtohhm
X-ME-Proxy: <xmx:Cfu2Zi3reX4KInSqV7QuXPdkifYsgPWWffzIirQEjMhjU2wIafa1ww>
    <xmx:Cfu2ZoFU83K5Cbhl8D3ycW0nrs3q1LeXkAfR4uhdUrfCjVa9Cmq4pQ>
    <xmx:Cfu2Zj99WdXu0AboGzSt1lU588y1DjcDCiRAf7WzS2jblcvoGlt_bA>
    <xmx:Cfu2Zll_UshzvzUIJ4WluNJsxz_NJjiTFsJy4VqipUgG0aaCBCeG6w>
    <xmx:Cfu2ZsCrFjaUmGZTL0wYQnZ6fZs1HIeRbC9esb5_UXcVuoUaMyDBX6Tl>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Aug 2024 01:30:46 -0400 (EDT)
Date: Sat, 10 Aug 2024 15:30:49 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: linux-m68k@lists.linux-m68k.org, debian-68k@lists.debian.org, 
    Stan Johnson <userm57@yahoo.com>
Subject: Re: dump, restore
In-Reply-To: <c3f33e0e-d04b-22e9-ee63-7783e6d12c62@gmail.com>
Message-ID: <09cb1927-2d7f-85f6-ea25-1316a322e182@linux-m68k.org>
References: <6d0e0caf-6d32-c7d0-c02c-42830d9636d0.ref@yahoo.com> <6d0e0caf-6d32-c7d0-c02c-42830d9636d0@yahoo.com> <ebf3c8dd-9c1d-602d-2f7a-9adb99950264@linux-m68k.org> <b18c5784-6f21-9a2c-422d-b6fd4c4811dc@yahoo.com> <be039a4b-639d-3b15-58e0-e7f2ff104240@linux-m68k.org>
 <43997c51-ef4e-9071-f9eb-087be2586490@linux-m68k.org> <c3f33e0e-d04b-22e9-ee63-7783e6d12c62@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Sat, 10 Aug 2024, Michael Schmitz wrote:

> >> Anyway, if I run dump under strace I see no CLONE_INTO_CGROUP flag:
> 
> strace may not be aware of the CLONE_INTO_CGROUP flag yet? How old is 
> your strace binary?
> 

I don't think strace is the problem. If it was, we should still see all 
the flags in the disassembly, in the constant passed to the syscall.

> >> clone(child_stack=NULL, flags=CLONE_IO|SIGCHLD) = -1 EBADF (Bad file
> >> descriptor)
> >>
> >> The -EBADF result was introduced into cgroup_css_set_fork() by the
> >> commit above. That should not happen unless CLONE_INTO_CGROUP was set,
> >> but strace says its not. So I don't know what's going on here.
> >>
> >
> > Here's what gdb says, FWIW...
> >
> > # gdb
> > GNU gdb (Debian 13.1-3) 13.1
> > ...
> > (gdb) file /usr/sbin/dump
> > Reading symbols from /usr/sbin/dump...
> > Reading symbols from
> > /usr/lib/debug/.build-id/24/071a827207bee9c025d364137514447279302b.debug...
> > (gdb) run -0f /dev/null /dev/sda
> > Starting program: /usr/sbin/dump -0f /dev/null /dev/sda
> >   DUMP: Date of this level 0 dump: Fri Aug  9 23:37:15 2024
> >   DUMP: Dumping /dev/sda (an unlisted file system) to /dev/null
> >   DUMP: Label: none
> >   DUMP: Writing 10 Kilobyte records
> >   DUMP: mapping (Pass I) [regular files]
> >   DUMP: mapping (Pass II) [directories]
> >   DUMP: estimated 3595695 blocks.
> >   DUMP: Context save fork fails in parent 671
> > [Inferior 1 (process 671) exited with code 03]
> > (gdb) b fork_clone_io
> > Breakpoint 1 at 0x80009dbc: file tape.c, line 740.
> > (gdb) run -0f /dev/null /dev/sda
> > Starting program: /usr/sbin/dump -0f /dev/null /dev/sda
> >   DUMP: Date of this level 0 dump: Fri Aug  9 23:38:17 2024
> >   DUMP: Dumping /dev/sda (an unlisted file system) to /dev/null
> >   DUMP: Label: none
> >   DUMP: Writing 10 Kilobyte records
> >   DUMP: mapping (Pass I) [regular files]
> >   DUMP: mapping (Pass II) [directories]
> >   DUMP: estimated 3595695 blocks.
> >
> > Program received signal SIGSEGV, Segmentation fault.
> > 0x00000001 in ?? ()
> > (gdb) l fork_clone_io
> > warning: Source file is more recent than executable.
> > 735
> > 736     #ifdef __linux__
> > 737     #if defined(SYS_clone) && defined(CLONE_IO)
> > 738     pid_t
> > 739     fork_clone_io(void)
> > 740     {
> > 741        pid_t res,parent;
> > 742        parent=getppid();            /* az hackety hack... */
> > 743
> > 744        res=syscall(SYS_clone, CLONE_ARGS);
> > 745        getppid();
> > 746        /* as per clone call manpage: caching! */
> > 747        getpid();
> > 748     #ifdef __alpha__
> > 749        syscall(SYS_getxpid);
> > 750     #else
> > 751         syscall(SYS_getpid);
> > 752     #endif
> > 753
> > 754        /* az: clone manpage doesn't say jack about what the
> > (gdb) disas fork_clone_io
> > Dump of assembler code for function fork_clone_io:
> >    0x80009dbc <+0>:     movel %d3,%sp@-
> >    0x80009dbe <+2>:     movel %d2,%sp@-
> >    0x80009dc0 <+4>:     bsrl 0x80004200 <getppid@plt>
> >    0x80009dc6 <+10>:    movel %d0,%d3
> >    0x80009dc8 <+12>:    clrl %sp@-
> >    0x80009dca <+14>:    clrl %sp@-
> >    0x80009dcc <+16>:    clrl %sp@-
> >    0x80009dce <+18>:    movel #-2147483631,%sp@-
> >    0x80009dd4 <+24>:    pea 0x78
> >    0x80009dd8 <+28>:    bsrl 0x80003fd0 <syscall@plt>
> >    0x80009dde <+34>:    movel %d0,%d2
> >    0x80009de0 <+36>:    bsrl 0x80004200 <getppid@plt>
> >    0x80009de6 <+42>:    bsrl 0x80003c9c <getpid@plt>
> >    0x80009dec <+48>:    pea 0x14
> >    0x80009df0 <+52>:    bsrl 0x80003fd0 <syscall@plt>
> >    0x80009df6 <+58>:    bsrl 0x80004200 <getppid@plt>
> >    0x80009dfc <+64>:    lea %sp@(24),%sp
> >    0x80009e00 <+68>:    cmpl %d0,%d3
> >    0x80009e02 <+70>:    beqs 0x80009e06 <fork_clone_io+74>
> >    0x80009e04 <+72>:    clrl %d2
> >    0x80009e06 <+74>:    movel %d2,%d0
> >    0x80009e08 <+76>:    movel %sp@+,%d2
> >    0x80009e0a <+78>:    movel %sp@+,%d3
> >    0x80009e0c <+80>:    rts
> > End of assembler dump.
> > (gdb)
> >
> > Is this clone syscall (0x78) really executing sys_clone3()? Also,
> 
> Nope, syscall no. 120 calls __sys_clone() which in turn calls 
> m68k_clone() which emulates sys_clone() (roundabout way due to different 
> calling conventions on m68k).
> 
> clone3 is syscall 435 (calling __sys_clone3() -> m68k_clone3() -> 
> sys_clone3()).
> 

What confused me was that 'git bisect' fingered what looked like a clone3 
patch, but it turns out that this patch affects anything that calls 
cgroup_can_fork(), that is, any syscalls that call copy_process().

> But as long as syscall() takes care of the calling convention, I see no 
> reason why that way of calling sys_clone() would fail.
> 

The interesting thing about the calling convention is that the flags make 
up a 32-bit quantity when passed to clone as an int, and a 64-bit quantity 
when passed to clone3 as struct clone_args.flags.

So I've just added some printk() statements and found that m68k_clone() 
messed up the flags in the kernel_clone_args struct: I'm seeing 
0xFFFFFFFF80000000 which explains how CLONE_INTO_CGROUP got set.

I'll send a patch.
