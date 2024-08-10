Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A41F1B960
	for <linux-m68k@lists.linux-m68k.org>; Sat, 10 Aug 2024 00:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723250568; cv=none; b=iv2VO89J/gvA2i34+OnE9s1oBs89/xRZzuDAGUFg/qAjFX+Ze8/Ix5xQcMMRGpQbnyf8odNG1K9z9WJ2IqTuysBNnWC4Yb+Md15pU2aX4s4ZOxmDu4QuGL41pJ4ccdRC7lLR8gcD/9pYmvg/Zbf6Zp1mZqOWXfWMx88db8CnszI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723250568; c=relaxed/simple;
	bh=f05FXFP6ZEHnDzdnVrVllbZhx1pZ7ExZmvJQlMuocZQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gf3Z9CcLmimcWPwpko4lB5sgalg/ZQLpTlZPD7pPcQWS+8Fu9d5nQGai3o/zzNZAZAQ/q3DVELobTmDfanKGNS4pGzQUU7DNI9QhrOU3Cjw10puvojSs6ATXpD6y2h46rx6L7hXLDNcKrrbOQ/wBZ3I5hivHggRY6ZA4Cs7qYxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Va7oR+Q2; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Va7oR+Q2"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id EF90C114AB96;
	Fri,  9 Aug 2024 20:42:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 09 Aug 2024 20:42:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1723250563; x=1723336963; bh=30OVoDQciVj1kfHLky4awdyO77Qj
	2+kK7ncbxoDwX/E=; b=Va7oR+Q2QuBbi6JD8aF6ZUt2tQnfhtv+cQfmqpIGXVbe
	pE2K2FplYaDepeV9sk3gTzGhV8zQ711r/0kPBKYyMuivu6+HtfJasgrw9v1BSB+X
	kxHyU8fUUKoEDatct7qdCTnPi/b38X3XrDuFvFFDqmhvMnxRGY6ARdh4NOqYcQ1Q
	weiNEpyVsv6vbS4gSUdVndCfPC4EAu5jFwbCKCzX1j67anvHSk4elA80Qn0M3L/z
	Fqr/Na+wgetK3JYuQyFkBYus7HN67kJ3WyNlHztXwRAWIsju6eVquKwf1vTzApxt
	jKpebvnMldkLRRojfh+CcXaYRv+mCURTFqAi/CE/2Q==
X-ME-Sender: <xms:g7e2ZqpO0QqQ5DJSgfObUToO-6-P18_rIHy5ALJAW7b8__XIqSfbAg>
    <xme:g7e2ZopWeeBAqqM6legB4IdhdxipermBph3cgIXyEv9yZqQt5w1GBHm0CUORv1bYg
    68BipWtnFXouXBuiLk>
X-ME-Received: <xmr:g7e2ZvMsAgK2jx4oXSNsfQ9vbrsiqbKOafFAluFWP6IWqP0nx3vhVRVfIXoE7csGKJggws42sxYgY6LmTx_LN1hyWur5k8jgSZo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrleehgdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuf
    gjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhh
    rghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtthgvrhhnpeelueehle
    ehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeuheeuleenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinh
    hugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehlihhnuhigqdhmieekkheslhhishhtshdrlhhinhhugidqmheike
    hkrdhorhhgpdhrtghpthhtohepuggvsghirghnqdeikehksehlihhsthhsrdguvggsihgr
    nhdrohhrghdprhgtphhtthhopehushgvrhhmheejseihrghhohhordgtohhm
X-ME-Proxy: <xmx:g7e2Zp7hNj7Oww_XM_vGGk5y7Um5OHcj18POa8qoYre4ktbuz2OhwA>
    <xmx:g7e2Zp7I_Qn9r7psUMg9gK9s2dmOq379R6OM6jdS7iLxII4yDN1tXA>
    <xmx:g7e2Zpj72rkvv2Va3aM8pilF9-LDNThxKh4MlbecC0sogZMi4aFcHg>
    <xmx:g7e2Zj5BBRNHyH7PxYpIdDJ0dIl7HhaFdWvCOm-ReqgweAuqRoJ3xQ>
    <xmx:g7e2ZpEL8safhCvFPGbq7ckmHRT79Fus-3_vNHDOyrNX6TtGTnQgEbqV>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Aug 2024 20:42:41 -0400 (EDT)
Date: Sat, 10 Aug 2024 10:42:47 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
cc: debian-68k@lists.debian.org, Stan Johnson <userm57@yahoo.com>
Subject: Re: dump, restore
In-Reply-To: <be039a4b-639d-3b15-58e0-e7f2ff104240@linux-m68k.org>
Message-ID: <43997c51-ef4e-9071-f9eb-087be2586490@linux-m68k.org>
References: <6d0e0caf-6d32-c7d0-c02c-42830d9636d0.ref@yahoo.com> <6d0e0caf-6d32-c7d0-c02c-42830d9636d0@yahoo.com> <ebf3c8dd-9c1d-602d-2f7a-9adb99950264@linux-m68k.org> <b18c5784-6f21-9a2c-422d-b6fd4c4811dc@yahoo.com>
 <be039a4b-639d-3b15-58e0-e7f2ff104240@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Fri, 9 Aug 2024, I wrote:

> 
> On Sat, 3 Aug 2024, Stan Johnson wrote:
> 
> > 
> > Using "-a" appears to be a better option than just specifying a really 
> > long tape size. Unfortunately, it also doesn't work. The problem seems 
> > to affect only m68k; ppc-32, ppc-64, x86-32 and x86-64 all work as 
> > expected...
> 
> I reproduced the problem in QEMU and found it went away when I ran dump 
> under Linux v5.6. So I went through a lot of "git bisect" steps and the 
> culprit appears to be commit ef2c41cf38a7 ("clone3: allow spawning 
> processes into cgroups"). That seems plausible, since we are seeing an 
> error from fork_clone_io() below...
> 
> #ifdef __linux__
> #if defined(SYS_clone) && defined(CLONE_IO)
> pid_t
> fork_clone_io(void)
> {
>         return syscall(SYS_clone, CLONE_ARGS);
> }
> #endif
> #endif
> 
> That code bypasses the C library so I suppose it's not too surprising 
> that different architectures give different results...
> 
> Anyway, if I run dump under strace I see no CLONE_INTO_CGROUP flag:
> 
> clone(child_stack=NULL, flags=CLONE_IO|SIGCHLD) = -1 EBADF (Bad file 
> descriptor)
> 
> The -EBADF result was introduced into cgroup_css_set_fork() by the 
> commit above. That should not happen unless CLONE_INTO_CGROUP was set, 
> but strace says its not. So I don't know what's going on here.
> 

Here's what gdb says, FWIW...

# gdb
GNU gdb (Debian 13.1-3) 13.1
...
(gdb) file /usr/sbin/dump
Reading symbols from /usr/sbin/dump...
Reading symbols from /usr/lib/debug/.build-id/24/071a827207bee9c025d364137514447279302b.debug...
(gdb) run -0f /dev/null /dev/sda
Starting program: /usr/sbin/dump -0f /dev/null /dev/sda
  DUMP: Date of this level 0 dump: Fri Aug  9 23:37:15 2024
  DUMP: Dumping /dev/sda (an unlisted file system) to /dev/null
  DUMP: Label: none
  DUMP: Writing 10 Kilobyte records
  DUMP: mapping (Pass I) [regular files]
  DUMP: mapping (Pass II) [directories]
  DUMP: estimated 3595695 blocks.
  DUMP: Context save fork fails in parent 671
[Inferior 1 (process 671) exited with code 03]
(gdb) b fork_clone_io
Breakpoint 1 at 0x80009dbc: file tape.c, line 740.
(gdb) run -0f /dev/null /dev/sda
Starting program: /usr/sbin/dump -0f /dev/null /dev/sda
  DUMP: Date of this level 0 dump: Fri Aug  9 23:38:17 2024
  DUMP: Dumping /dev/sda (an unlisted file system) to /dev/null
  DUMP: Label: none
  DUMP: Writing 10 Kilobyte records
  DUMP: mapping (Pass I) [regular files]
  DUMP: mapping (Pass II) [directories]
  DUMP: estimated 3595695 blocks.

Program received signal SIGSEGV, Segmentation fault.
0x00000001 in ?? ()
(gdb) l fork_clone_io
warning: Source file is more recent than executable.
735
736     #ifdef __linux__
737     #if defined(SYS_clone) && defined(CLONE_IO)
738     pid_t
739     fork_clone_io(void)
740     {
741        pid_t res,parent;
742        parent=getppid();            /* az hackety hack... */
743
744        res=syscall(SYS_clone, CLONE_ARGS);
745        getppid();
746        /* as per clone call manpage: caching! */
747        getpid();
748     #ifdef __alpha__
749        syscall(SYS_getxpid);
750     #else
751         syscall(SYS_getpid);
752     #endif
753
754        /* az: clone manpage doesn't say jack about what the
(gdb) disas fork_clone_io 
Dump of assembler code for function fork_clone_io:
   0x80009dbc <+0>:     movel %d3,%sp@-
   0x80009dbe <+2>:     movel %d2,%sp@-
   0x80009dc0 <+4>:     bsrl 0x80004200 <getppid@plt>
   0x80009dc6 <+10>:    movel %d0,%d3
   0x80009dc8 <+12>:    clrl %sp@-
   0x80009dca <+14>:    clrl %sp@-
   0x80009dcc <+16>:    clrl %sp@-
   0x80009dce <+18>:    movel #-2147483631,%sp@-
   0x80009dd4 <+24>:    pea 0x78
   0x80009dd8 <+28>:    bsrl 0x80003fd0 <syscall@plt>
   0x80009dde <+34>:    movel %d0,%d2
   0x80009de0 <+36>:    bsrl 0x80004200 <getppid@plt>
   0x80009de6 <+42>:    bsrl 0x80003c9c <getpid@plt>
   0x80009dec <+48>:    pea 0x14
   0x80009df0 <+52>:    bsrl 0x80003fd0 <syscall@plt>
   0x80009df6 <+58>:    bsrl 0x80004200 <getppid@plt>
   0x80009dfc <+64>:    lea %sp@(24),%sp
   0x80009e00 <+68>:    cmpl %d0,%d3
   0x80009e02 <+70>:    beqs 0x80009e06 <fork_clone_io+74>
   0x80009e04 <+72>:    clrl %d2
   0x80009e06 <+74>:    movel %d2,%d0
   0x80009e08 <+76>:    movel %sp@+,%d2
   0x80009e0a <+78>:    movel %sp@+,%d3
   0x80009e0c <+80>:    rts
End of assembler dump.
(gdb) 

Is this clone syscall (0x78) really executing sys_clone3()? Also,
-2147483631 == CLONE_IO|SIGCHLD like strace said.

And why does it crash when I set a break point?
