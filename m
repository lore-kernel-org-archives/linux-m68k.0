Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4790D231858
	for <linux-m68k@lists.linux-m68k.org>; Mon, 28 Jul 2025 09:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695282; cv=none; b=GwgAqG2/OUpAdHTYaPlAGKQADKI6rYUBVvVGKnHn8fxvCOwy6gBaswf29yH9BU7Kj8Y0uf4wRs9N3YJShrek+VtPu9yzzdq6USLwdK5gkckAxYWSedIU1ybXlVwuc6IU1IHMkvmwl9JRq8nHuixdoLWnkUc2M2F3Iyk63sfi8z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695282; c=relaxed/simple;
	bh=FVjrhbgU51oFrsK8FhKQpqxMkotAxlE+hef9bztLMf0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gRACm/hOlOIUM+F2MaFl80Y84t1QFbt+Lf3LI0Y4+eHAhLVF72cJqjHTqkDCMbS3tzWE/W7LTHy0xQNLaslzv0swq6DBdyYNOUiIB1FTp1o/b4mYWwHiMXBJOrlNLEzwCXGpwQOXJa3Krj/rUObwg2HQBsLTbOwwnaz1h4i1V5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cra3hL6W; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cra3hL6W"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-235f9ea8d08so39642455ad.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 28 Jul 2025 02:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753695280; x=1754300080; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoKs7p6HZYNszKO17OO4KdXekmUg9ugS36Em0DKxuqU=;
        b=cra3hL6WnRLSXIHFFApSSy02M7dL+iQFRx0LinV3XA8eTAw0Eqg92HOuDCF38ZebgU
         7Ztl7KheHHzXECyEy3E8TxTJTKS0Cj3dZbpl/oBUFTbxTaU6aXI9xaUcbHsgu2IsyYee
         NxLxeyg7Rerg+V+tmpxgs/CSqd5w7Yo9akXbs3Jj7WisQMdReIA+FoEBUELBzu9zieiO
         yszgk7XoZO/jx2MhVAxGHXkTBez3eWk8tkG0DHlX87JgdczVvX1spmT8+9aB/RG2zx29
         9R9OXOWB0ertWa475qoXZieIVNw6efi0r77QMhkkpxTrx3eUS12ePWV06xtBHrbinD5/
         02bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695280; x=1754300080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZoKs7p6HZYNszKO17OO4KdXekmUg9ugS36Em0DKxuqU=;
        b=kMxJs4yhzkxIs/RF5ayyV1qKAOuANsUa7IfTiKQaiqMcUOEDEaMRMnwKtonqr4NqqJ
         lbJ4+tzQ63yBFO/q4LsEzAeC709HcdSEfyQiM1bGouTCR+JCqo26rFPe0maifuSQej1r
         IjGpRQtOWeIofTufumaTsGyLM0jQ6TRBR0awLI38KM3flbH6JfE4Bj1aaVCQvVMOzoHy
         pkczE5GyHdF5wJDe1DVpYAQWgENITJIMly+TQLXoUMYiCW7AITmRg/pe2S34KtHLMikx
         DCQZk5V2lEMrnyl6oQFGg0SlZaAQ7TcDpRD57sXM0VK0EOsyrdC4efBkzGDXNPZB6h8m
         4Rng==
X-Gm-Message-State: AOJu0Yy0mzh2q5zkwKph7EvEUtHTsqdwQ0OD7LUIMyoKEZ0fDmUr2CyJ
	MkIui1iNY07x1Q8MBUjBaJegbSq3M8uYP7+Ty48QHin8/cfmFQ3EHpGg
X-Gm-Gg: ASbGncueIbY8c6vbsVw0EHHyPaqFkVcZA2iYpJz7hH7j5EaRv+41a7EgW0EWGGNQWsT
	oq21KWLYzRQlIcNLPNdzJfrmH8798cTAQG4KLOCAJInW010BX4co4C5F5g5PAtkuKdJ2bAi9c4f
	TUf3v1MRCSA1puybrjIUUEDMjOjFFa3Q/GUW43dTt6Qko7ILFz3HyFPpiNLrJ2HqyfoxSLL6udz
	kw1B2fKHohIyK+/wsQvKgkvj6lCprggMk3EMoGUKAhKuGrEhiDDsES0BSRvxwZx9/tbPNc/PDuk
	pLbDKE9cECOtJA38Ms/csS3rTQE1dl+zh0RbdZDabWDu9OA0r9glePL9DEb9GRwJ+7pzukgWaCY
	efxkI1mlW7fG0KTcimGrURud4hUcaaiWGkP5Bj5nHw2Y+DoASfA==
X-Google-Smtp-Source: AGHT+IGjJPaZL1a0kCFTxQSZwuSbVti44KmI2KrA1FlBXfoREc0LVs07EjrFSf+mheRkE+jWaoW3Qg==
X-Received: by 2002:a17:903:2345:b0:235:e1d6:4e22 with SMTP id d9443c01a7336-23fb3040f6cmr137246975ad.18.1753695280353;
        Mon, 28 Jul 2025 02:34:40 -0700 (PDT)
Received: from localhost.localdomain ([49.36.70.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe546bebsm49809855ad.179.2025.07.28.02.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:34:39 -0700 (PDT)
From: Dishank Jogi <jogidishank503@gmail.com>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	darshanrathod475@gmail.com,
	Dishank Jogi <jogidishank503@gmail.com>
Subject: [PATCH] zorro: fix checkpatch error by avoiding assignment in if-statement.
Date: Mon, 28 Jul 2025 09:34:12 +0000
Message-ID: <20250728093412.48065-1-jogidishank503@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These changes improve code readability and bring the file
in line with the Linux kernel coding style.

No functional changes.

Signed-off-by: Dishank Jogi <jogidishank503@gmail.com>
---
 drivers/zorro/gen-devlist.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/zorro/gen-devlist.c b/drivers/zorro/gen-devlist.c
index e325c5ce995b..ff4515e02409 100644
--- a/drivers/zorro/gen-devlist.c
+++ b/drivers/zorro/gen-devlist.c
@@ -44,7 +44,8 @@ main(void)
 
 	while (fgets(line, sizeof(line)-1, stdin)) {
 		lino++;
-		if ((c = strchr(line, '\n')))
+		c = strchr(line, '\n')
+		if (c)
 			*c = 0;
 		if (!line[0] || line[0] == '#')
 			continue;
@@ -68,7 +69,8 @@ main(void)
 					fprintf(devf, "\tPRODUCT(%s,%s,\"", manuf, line+1);
 					pq(devf, c);
 					fputs("\")\n", devf);
-				} else goto err;
+				} else
+					goto err;
 				break;
 			default:
 				goto err;
-- 
2.43.0

