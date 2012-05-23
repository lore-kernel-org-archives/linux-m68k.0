From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: What ISA hardware is integrated into m68k bridges
Date: Wed, 23 May 2012 20:51:32 +1200
Message-ID: <4FBCA514.1040108@gmail.com>
References: <20120520163105.GC21177@windriver.com> <CAOmrzk+hWvu8L51JXogwj6A=KFsj_nu_UX2qS_HABxyks-8srw@mail.gmail.com> <4FBB9A12.8000101@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:58700 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750895Ab2EWIvi (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 23 May 2012 04:51:38 -0400
Received: by pbbrp8 with SMTP id rp8so9588040pbb.19
        for <linux-m68k@vger.kernel.org>; Wed, 23 May 2012 01:51:38 -0700 (PDT)
In-Reply-To: <4FBB9A12.8000101@windriver.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, Alan Cox <alan@linux.intel.com>

Hi Paul,

On 23/05/12 01:52, Paul Gortmaker wrote:
>> Not sure it's still considered ISA based in its current state, but the
>> smc91x is another one used on Atari. That one's got an interrupt
>> though, and I had confirmation that it works fine from a user just a
>> few days ago.
> Thanks Michael for the level headed on-topic reply, I appreciate
> it.  That smc is used by 20-odd arm defconfigs, so it really isn't
> valid to consider it as a stand alone ISA card used just by older
> x86 hardware with ISA bus.  In fact I'm not sure it ever shipped as
> a standalone ISA card...
Just the infamous NE2000 clone then for Atari (RTL8019AS is what it 
reads on the ISA card hanging off the ROM port of my Falcon).

Cheers,

   Michael
