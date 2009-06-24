From: Steven King <sfking@fdwdc.com>
Subject: Re: [PATCH 00/13] revised Coldfire generic GPIO (mk68nommu)
Date: Wed, 24 Jun 2009 12:09:25 -0700
Message-ID: <200906241209.26199.sfking@fdwdc.com>
References: <1245460272-4329-1-git-send-email-sfking@fdwdc.com> <4A41C04F.6050909@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp107.biz.mail.mud.yahoo.com ([68.142.200.255]:29879 "HELO
	smtp107.biz.mail.mud.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752312AbZFXTJ2 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 24 Jun 2009 15:09:28 -0400
In-Reply-To: <4A41C04F.6050909@snapgear.com>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-kernel@vger.kernel.org, uclinux-dev@uclinux.org, linux-m68k@vger.kernel.org

On Tuesday 23 June 2009 10:57:35 Greg Ungerer wrote:
> Hi Steven,
>
> This looks pretty good to me.
> Do you want me to apply the the m68knommu git tree?
> (Ideally I'll push it to Linus in the 2.6.32 merge window).

That would be great.  There are some things I'd like to add to this (support for 
pinmux, etc.) but that would be in the form of patches ontop of this.

-- 
Steven King -- sfking at fdwdc dot com
