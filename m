From: "David Laight" <David.Laight@ACULAB.COM>
Subject: RE: [PATCH] atomic: add *_dec_not_zero
Date: Wed, 4 May 2011 09:05:53 +0100
Message-ID: <AE90C24D6B3A694183C094C60CF0A2F6D8AD0D__21856.790679931$1304496426$gmane$org@saturn3.aculab.com>
References: <1304458235-28473-1-git-send-email-sven@narfation.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx0.aculab.com ([213.249.233.131]:36985 "HELO mx0.aculab.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751706Ab1EDIGv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 4 May 2011 04:06:51 -0400
Content-class: urn:content-classes:message
In-Reply-To: <1304458235-28473-1-git-send-email-sven@narfation.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Sven Eckelmann <sven@narfation.org>, linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org, linux-mips@linux-mips.org, linux-m32r@ml.linux-m32r.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, linux-cris-kernel@axis.com, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org, Chris Metcalf <cmetcalf@tilera.com>, David Howells <dhowells@redhat.com>, linux-m68k@lists.linux-m68k.org, linux-am33-list@redhat.com, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, uclinux-dist-devel@blackfin.uclinux.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org

 
> Introduce an *_dec_not_zero operation.  Make this a special case of
> *_add_unless because batman-adv uses atomic_dec_not_zero in different
> places like re-broadcast queue or aggregation queue management. There
> are other non-final patches which may also want to use this macro.

Isn't there a place where a default definition of this can be
defined? Instead of adding it separately to every architecture.

	David
