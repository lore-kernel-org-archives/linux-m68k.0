Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8493DCDA4
	for <linux-m68k@lists.linux-m68k.org>; Mon, 31 Aug 2026 09:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169768; cv=none; b=Ee53XKNoePLy2lLp+zy20sDm65FjByGk2ithMJRji3+xtatJ70wIcfHayoN9hreGpdYl26LgtB/wJLg4rrRPyMmgzrBDiT1QzypiSOhY+ISXPDTgEKyDKCHgHuaMDqyC1DSY3lSaQoTtnS90AfonnCYijzKb1Pdzepz7QBi6MVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169768; c=relaxed/simple;
	bh=BPSBHVHwtg6F6NTQNRQrL+63+1rXBP6TQlmVbo/fiMk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RqE61HglV82O7B67GABHtKLKhJ5SRE9PaOjE0inAYm5dPFyIs4bOo0/g1VrPo4o0wR3gVDur8zB/HN12iHqRVSJUlMX6URswmj97M2/IlWQ+mbg8K9ZJ8vfMp/jmg7qQv0TwgQhUOPqO4g2kpheYXR8oQ5wT5D7/sUlbJS0DtKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D87B6013A;
	Mon, 31 Aug 2026 09:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC761F000E9;
	Mon, 31 Aug 2026 09:49:23 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] scsi: zorro7xx: Use individual zorro_driver_data structures
Date: Mon, 31 Aug 2026 11:49:20 +0200
Message-ID: <7deafe83754415c5beb280f3c1808e153029e890.1788169600.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using an array of zorro_driver_data objects and referring to its
elements by index obfuscates the code and is error-prone.

Improve readability and reduce code size by replacing the array (which
includes an unneeded sentinel) by individual zorro_driver_data objects.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Compile-tested + assembler output inspected.
---
 drivers/scsi/zorro7xx.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/scsi/zorro7xx.c b/drivers/scsi/zorro7xx.c
index 21c769dc1ecbda49..89475632675c0fb1 100644
--- a/drivers/scsi/zorro7xx.c
+++ b/drivers/scsi/zorro7xx.c
@@ -35,38 +35,45 @@ static struct scsi_host_template zorro7xx_scsi_driver_template = {
 	.module		= THIS_MODULE,
 };
 
-static struct zorro_driver_data {
+struct zorro_driver_data {
 	const char *name;
 	unsigned long offset;
 	int absolute;	/* offset is absolute address */
-} zorro7xx_driver_data[] = {
-	{ .name = "PowerUP 603e+", .offset = 0xf40000, .absolute = 1 },
-	{ .name = "WarpEngine 40xx", .offset = 0x40000 },
-	{ .name = "A4091", .offset = 0x800000 },
-	{ .name = "GForce 040/060", .offset = 0x40000 },
-	{ 0 }
+};
+
+static const struct zorro_driver_data zorro7xx_blizzard_603e_plus_data = {
+	.name = "PowerUP 603e+", .offset = 0xf40000, .absolute = 1
+};
+static const struct zorro_driver_data zorro7xx_warp_engine_40xx_data = {
+	.name = "WarpEngine 40xx", .offset = 0x40000
+};
+static const struct zorro_driver_data zorro7xx_a4091_data = {
+	.name = "A4091", .offset = 0x800000
+};
+static const struct zorro_driver_data zorro7xx_gforce_040_060_data = {
+	.name = "GForce 040/060", .offset = 0x40000
 };
 
 static struct zorro_device_id zorro7xx_zorro_tbl[] = {
 	{
 		.id = ZORRO_PROD_PHASE5_BLIZZARD_603E_PLUS,
-		.driver_data_ptr = &zorro7xx_driver_data[0],
+		.driver_data_ptr = &zorro7xx_blizzard_603e_plus_data,
 	},
 	{
 		.id = ZORRO_PROD_MACROSYSTEMS_WARP_ENGINE_40xx,
-		.driver_data_ptr = &zorro7xx_driver_data[1],
+		.driver_data_ptr = &zorro7xx_warp_engine_40xx_data,
 	},
 	{
 		.id = ZORRO_PROD_CBM_A4091_1,
-		.driver_data_ptr = &zorro7xx_driver_data[2],
+		.driver_data_ptr = &zorro7xx_a4091_data,
 	},
 	{
 		.id = ZORRO_PROD_CBM_A4091_2,
-		.driver_data_ptr = &zorro7xx_driver_data[2],
+		.driver_data_ptr = &zorro7xx_a4091_data,
 	},
 	{
 		.id = ZORRO_PROD_GVP_GFORCE_040_060,
-		.driver_data_ptr = &zorro7xx_driver_data[3],
+		.driver_data_ptr = &zorro7xx_gforce_040_060_data,
 	},
 	{ }
 };
-- 
2.43.0

