From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 0/3] Atari input patches
Date: Sun, 8 May 2011 23:00:48 -0700
Message-ID: <20110509060048.GA27577__25652.8902602897$1304922543$gmane$org@core.coreip.homeip.net>
References: <1304846247-12401-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1304846247-12401-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-input@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Hi Geert,

On Sun, May 08, 2011 at 11:17:24AM +0200, Geert Uytterhoeven wrote:
> 	Hi Dmitry,
> 
> Here are 3 patches to fix keyboard and mouse on Atari, after conversion to
> the "new" (several years old) input framework.
> 
>   [1/3] input/atari: Use the correct mouse interrupt hook
>   [2/3] input/atari: Fix atarimouse init
>   [3/3] input/atari: Fix mouse movement and button mapping
> 
> Will you take them for 2.6.40, or can I get them in through my m68k tree?

I can either take them or you can push them. I do not really have a
preference. There is nothing in my tree that would conflict with these
as far as I know.

Thanks.

-- 
Dmitry
