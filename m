From: Steven King <sfking@fdwdc.com>
Subject: Re: [uClinux-dev] ltib vs uclinux-dist
Date: Tue, 1 Sep 2009 11:34:12 -0700
Message-ID: <200909011134.13102.sfking__31530.4777156145$1251830487$gmane$org@fdwdc.com>
References: <20090812194002.GA2309@frolo.macqel> <4A9D0350.9050402@snapgear.com> <20090901115206.GA12946@frolo.macqel>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp103.biz.mail.mud.yahoo.com ([68.142.200.238]:34043 "HELO
	smtp103.biz.mail.mud.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1751650AbZIASlM (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 1 Sep 2009 14:41:12 -0400
In-Reply-To: <20090901115206.GA12946@frolo.macqel>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uclinux-dev@uclinux.org
Cc: Philippe De Muyter <phdm@macqel.be>, linux-m68k@lists.linux-m68k.org

On Tuesday 01 September 2009 04:52:06 Philippe De Muyter wrote:

> > Longer term I think we need to fully merge m68k and m68knommu
> > before we push any MMU ColdFire patches to mainline.
>
> I fully agree with that.
>
> Who is currently working on the m68k/m68knommu merge ?
> Is there a mailing-list, website or other network resource about that ?
> The arch trees of m68k and m68knommu have different structures.  What will
> the structure of the merged tree look like ?

I've been looking at this, and while I dont have anything ready yet, it doesnt 
seem too difficult.

m68knommu/configs and platform can be merged directly into m68k; its the files 
in kernel, lib and mm and especially the m68k Kconfig and Makefile that require 
some effort.  The trivial approach would be to do some thing similar to what 
was done for the include files: append a suffix of _no to the m68knommu version 
of the file and _mm to the m68k version and then have a wrapper that uses 
#ifdef __uClinux__ to select between the two.

Of course that doesn't gain us much, except once we then fixup Kconfig and 
Makefile and have a working build, we can then incrementally merge each of the 
files in kernel, lib and mm while testing with a working build.

-- 
Steven King -- sfking at fdwdc dot com
