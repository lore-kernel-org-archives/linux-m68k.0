From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 00/13] revised Coldfire generic GPIO (mk68nommu)
Date: Thu, 02 Jul 2009 14:36:42 +1000
Message-ID: <4A4C395A.3010607@snapgear.com>
References: <1245460272-4329-1-git-send-email-sfking@fdwdc.com> <4A41C04F.6050909@snapgear.com> <200906241209.26199.sfking@fdwdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from rex.securecomputing.com ([203.24.151.4]:44922 "EHLO
	cyberguard.com.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750850AbZGBEgl (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 2 Jul 2009 00:36:41 -0400
In-Reply-To: <200906241209.26199.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Steven King <sfking@fdwdc.com>
Cc: linux-kernel@vger.kernel.org, uclinux-dev@uclinux.org, linux-m68k@vger.kernel.org

Hi Steven,

Steven King wrote:
> On Tuesday 23 June 2009 10:57:35 Greg Ungerer wrote:
>> Hi Steven,
>>
>> This looks pretty good to me.
>> Do you want me to apply the the m68knommu git tree?
>> (Ideally I'll push it to Linus in the 2.6.32 merge window).
> 
> That would be great.  There are some things I'd like to add to this (support for 
> pinmux, etc.) but that would be in the form of patches ontop of this.

I have pushed those patches into:

git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-linus

(and they are also in the "for-next" branch too).

Regards
Greg



------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
