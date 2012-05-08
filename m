From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 1/1] 68000 code integration
Date: Tue, 8 May 2012 12:56:28 +1000
Message-ID: <4FA88B5C.3040406@snapgear.com>
References: <1335818553-14402-1-git-send-email-ljalvs@gmail.com> <4FA37D01.2000107@snapgear.com> <CAGj5WxA=uO0Pkbn5UM4Tu3oGFO9JAXA7mEiwNQ3cuiOHM2b+hg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:54333 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758177Ab2EHDAs (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 7 May 2012 23:00:48 -0400
In-Reply-To: <CAGj5WxA=uO0Pkbn5UM4Tu3oGFO9JAXA7mEiwNQ3cuiOHM2b+hg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Luis Alves <ljalvs@gmail.com>
Cc: uClinux development list <uclinux-dev@uclinux.org>, linux-m68k@vger.kernel.org, gerg@uclinux.org

Hi Luis,

On 04/05/12 19:48, Luis Alves wrote:
> On Fri, May 4, 2012 at 7:53 AM, Greg Ungerer<gerg@snapgear.com>  wrote:
[snip]
>> An observation from the patch, the 68000/entry-*.S files all look
>> quite similar. Is there any way they can be merged into a single
>> file?
>
> I'm just noticed that accidentally I've added the 'entry-68000.S'!
> This file should be removed.
>
> About merging, yes I plan to do it later. The thing is that in my
> first attempt of running this kernel in the 68000 the entry code from
> the  68328 had a strange behavior (you should remember debugging this
> with me - lots of softlocks).
> Then I've used the entry.S from coldfire sources as base and it worked smooth.

I suspect the existing 68x328 code is broken, and we probably want
to use your fixed and working version of this entry.S for all.

I don't have any real 68328 based hardware, but many years ago
people used the xcopilot simulator for 68328 testing. I don't know
what the state of it these days, but it may still be useful.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
