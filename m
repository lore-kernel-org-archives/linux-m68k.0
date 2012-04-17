From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: fix id number for second eth device on 5275 ColdFire
Date: Tue, 17 Apr 2012 23:22:55 +1000
Message-ID: <1334668975-30794-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:29081 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932302Ab2DQNYT (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 17 Apr 2012 09:24:19 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The second ColdFire FEC ethernet device should have an id number of 1,
not 0. Otherwise it clashes with the first FEC ethernet device.

On booting a kernel on a 5275 based board you will get messages out of
the kernel like this:

    <4>------------[ cut here ]------------
    <4>WARNING: at fs/sysfs/dir.c:508 0x0a8b50()
    <4>sysfs: cannot create duplicate filename 'fec.0'

And likely you won't be able to completely boot up after this at all.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/coldfire/device.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/platform/coldfire/device.c b/arch/m68k/platform/coldfire/device.c
index fa50c48..7af9736 100644
--- a/arch/m68k/platform/coldfire/device.c
+++ b/arch/m68k/platform/coldfire/device.c
@@ -114,7 +114,7 @@ static struct resource mcf_fec1_resources[] = {
 
 static struct platform_device mcf_fec1 = {
 	.name			= "fec",
-	.id			= 0,
+	.id			= 1,
 	.num_resources		= ARRAY_SIZE(mcf_fec1_resources),
 	.resource		= mcf_fec1_resources,
 };
-- 
1.7.0.4
