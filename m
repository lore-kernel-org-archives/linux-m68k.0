From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 02/10] MAINTAINERS - Add file patterns
Date: Wed, 08 Apr 2009 08:44:27 -0700
Message-ID: <1239205467.32726.40.camel@localhost>
References: <1239167872-8179-1-git-send-email-joe@perches.com>
	 <1239167872-8179-3-git-send-email-joe@perches.com>
	 <10f740e80904072359n49ab104fjc545fa9f4617d5ad@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from 136-022.dsl.LABridge.com ([206.117.136.22]:1096 "EHLO
	mail.perches.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755748AbZDHPqu (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Apr 2009 11:46:50 -0400
In-Reply-To: <10f740e80904072359n49ab104fjc545fa9f4617d5ad@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@kernel.org>, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, Joshua Thompson <funaho@jurai.org>

On Wed, 2009-04-08 at 08:59 +0200, Geert Uytterhoeven wrote:
> On Wed, Apr 8, 2009 at 07:17, Joe Perches <joe@perches.com> wrote:
> >  M68K ARCHITECTURE
> You can add drivers/zorro/ (Amiga Zorro bus) there, too
> >  M68K ON APPLE MACINTOSH
> That would be arch/m68k/mac/

commit 9cd0444bdf1476798f118cc6e4abe3f3072a3f76
Author: Joe Perches <joe@perches.com>
Date:   Wed Apr 8 08:39:56 2009 -0700

    MAINTAINERS - Update M68K patterns
    
    Signed-off-by: Joe Perches <joe@perches.com>
---
 MAINTAINERS |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 34c7903..b663cea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3510,27 +3510,29 @@ F:	include/asm-m32r/
 M68K ARCHITECTURE
 P:	Geert Uytterhoeven
 M:	geert@linux-m68k.org
 P:	Roman Zippel
 M:	zippel@linux-m68k.org
 L:	linux-m68k@lists.linux-m68k.org
 W:	http://www.linux-m68k.org/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git
 S:	Maintained
 F:	arch/m68k/
+F:	drivers/zorro/
 
 M68K ON APPLE MACINTOSH
 P:	Joshua Thompson
 M:	funaho@jurai.org
 W:	http://www.mac.linux-m68k.org/
 L:	linux-m68k@lists.linux-m68k.org
 S:	Maintained
+F:	arch/m68k/mac/
 
 M68K ON HP9000/300
 P:	Philip Blundell
 M:	philb@gnu.org
 W:	http://www.tazenda.demon.co.uk/phil/linux-hp
 S:	Maintained
 F:	arch/m68k/hp300/
 
 MAC80211
 P:	Johannes Berg


