From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] Coldfire GPIO corrections
Date: Fri, 30 Oct 2009 10:40:34 +1000
Message-ID: <4AEA3602.1060105@snapgear.com>
References: <200910151254.41599.sfking@fdwdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from rex.securecomputing.com ([203.24.151.4]:43862 "EHLO
	cyberguard.com.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753111AbZJ3Akx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 29 Oct 2009 20:40:53 -0400
In-Reply-To: <200910151254.41599.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Steven King <sfking@fdwdc.com>
Cc: uclinux-dev@uclinux.org, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org

Hi Steven,

Steven King wrote:
> Pin 0 of the EPORT is not connected on the 523x, 5271, 5275 and 528x and the 
> TIMER on the 523x has 8 pins, not 4.

Thanks, I have pushed this into the for-linus branch of

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git

Thanks
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
