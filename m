From: <gerg@snapgear.com>
Subject: [PATCH 0/9] m68knommu: consistently define ColdFire Peripheral registers
Date: Wed, 19 Sep 2012 15:08:35 +1000
Message-ID: <1348031324-13228-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:46975 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754713Ab2ISFHK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 19 Sep 2012 01:07:10 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org


The various ColdFire parts use different methods to address the internal
registers, some are absolute, some are relative to peripheral regions which
can be mapped at different address ranges (such as the MBAR and IPSBAR 
registers). Currently the address definitions are inconsistentely defined,
some include the peripheral region, some are just offsets, while some 
obviously need to be the fixed absolute address. This is leading to 
occasional bugs using the address definitions wrongly.

This patch series (and to some extent the next 2 after it as well) aims to
clean this up and make the address definitions consistent. The nice side
effect is that it makes the headers a lot more redable too.

Following on from the address definition changes I will be posting 2 more
patch series that fix up some of the bugs I referred to above, and also
clean out a lot of old unused junk lying around in the headers.
