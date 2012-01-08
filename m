From: Alan Hourihane <alanh@fairlite.co.uk>
Subject: Re: Atari TT (next)
Date: Sun, 08 Jan 2012 23:49:31 +0000
Message-ID: <4F0A2B8B.5060802@fairlite.co.uk>
References: <4F079F6B.8080502@fairlite.co.uk> <4F07EA66.6020603@gmail.com> <4F08E748.4020305@fairlite.co.uk> <4F0917E9.9090600@gmail.com> <CAMuHMdX2BaAp2N0e4aYPz7roaMFD14V1Y076geQQjpPw6-g-5Q@mail.gmail.com> <CAOmrzkJ6eCKCd0FRfYk7C5VvJeyhRT9Y7yy8m-mGPQeOaRScuQ@mail.gmail.com> <m2ipklluj4.fsf@igel.home> <CAOmrzkL45Tfs-t+BCoOTeKO4pb34gS9xeDh8-KyjnYETSfyNNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from fairlite.demon.co.uk ([80.176.228.186]:56035 "EHLO
	fairlite.demon.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754748Ab2AHXtj (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 Jan 2012 18:49:39 -0500
In-Reply-To: <CAOmrzkL45Tfs-t+BCoOTeKO4pb34gS9xeDh8-KyjnYETSfyNNA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On 08/01/12 23:39, Michael Schmitz wrote:
> Hi Andreas,
>
>>> support. Is there a strict requirement (from the kernel's early
>>> startup and mem_init POV) that the kernel has to reside in the first
>>> bootinfo memory chunk?
>> It is a requirement that the kernel is mapped at virtual address zero
>> since it is not relocatable.
> That much I understand - but can we tweak the bootinfo to report the
> chunks in physical address order? What I mean to say is - does the
> first bootinfo chunk get mapped at virtual address zero always, or is
> there some check to see what physical address corresponds to the
> kernel segment?
>

>From what I can see the first mem_info struct is always mapped at VA 0
which is done in paging_init() in mm/motorola.c

Alan.
