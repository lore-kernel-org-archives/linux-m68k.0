Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E3E27455
	for <linux-m68k@lists.linux-m68k.org>; Mon, 28 Jul 2025 07:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753686922; cv=none; b=ltjqGg5IVDXJB6Umg4ar7ZE3FC7jKh8cgK2yCZ2L7bpuPRZR4y5Q8MhfZF7++jZIYogQW5bTMjdqG9no4fzb2IdWGbfwWqE1OEYa9JFeNeqlt84wYyhVfZPM9qxMZ0hRn981Sk13UeZxBDkzp3WB0zo0vJlxnQD/2nghOImJzZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753686922; c=relaxed/simple;
	bh=Qu+DbYB1mcrZ5Kxz/2iCKbV7l5qicmShpukOPKfJbDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LVlgEpiXMCM/ldDX9KvH6cykV5sIfuY24hd3dQew74zZkXTvmiLNNZVrOebC9Ho9O38t597Q9OCsFBahiZlMEHuhoQTJ0LGy1IalptqxIy90O3+t1SoLJ8c7YKr6QCBxZp0uMNJvLiK5k7mOvUG8DPBkZ7CuiNDz7Ks0KL3Wtew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3Zu4fE4; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3Zu4fE4"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-31223a4cddeso2892964a91.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 28 Jul 2025 00:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753686920; x=1754291720; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E4TfQbNtdnmYD64u0Hy5ONSsQ+kBtDvQt5E0InoDD5M=;
        b=P3Zu4fE4NZOOi0Ts46lod6+6B1OBfNN1uJe1iiJ/L6Hu5kVTA9BA0gdVM1hnR2CF2y
         6o63VR8NnqwcoAZBz6X1IuoKM/p6n9WE/TykoA7nqxdYyLIqBtDINTqTGaKu29h9OpFw
         aY65GyUnQtlpGPuR0T6dUf3tV1i2MlOSnKhwO4NXrG4kwiItzs6pXw6PfiAAzC1NSSqU
         vJ7sv1qzKWejjam6BKr904ncA8hk7cPWiEAApoZSnD8MdxeqpWPa1abG5kLMP2MUhscK
         dP9nLJPqHfOoSR4pJ3DdfHZa4VbfZCX6+M0uC55uVbxWvY/Sh7rJ0ZPHPq+5EaUIxRHt
         Nqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753686920; x=1754291720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E4TfQbNtdnmYD64u0Hy5ONSsQ+kBtDvQt5E0InoDD5M=;
        b=s8YJKNeL0Dk0sBQsDVPT48FvWCNXwOF20BtNKPEF4qbTZSFSkFaP8T04ymx4oUaKEb
         Dfrn1tBCs8Tv1ufK94ghrfGWDiK3Up0jD05XmsBn3x0cBxhiNT3A1Q7RPXqLVjv/KiFu
         JF2rzx8lJ7ZTCuteZaAq3IBT+JopJV+sSO0pNNXSNTLoKN416uXt/HuqIFvwS6qu6bru
         TMVf2DEMcl3La/UVJ1BCgtpxwb0FIe3YIYltUwkpIqqPu+37QB5Xeva/POC6apI8eHeN
         lBWjpwpD7VCoZHbs+aT1ajjBljvEiX6nH67OigRzS7bmQQrNMobGHEuTU1ZuosOb9A79
         0Eww==
X-Gm-Message-State: AOJu0YyCQOcj9DoidXp7owDd9XE2QP/Qb9NAPGRYCv19126iLbeHzUau
	ZcUAH98yl53DhFXIoj46gHN8e8yet2Spq9HNvmc25RoIPDaE9h35eepV
X-Gm-Gg: ASbGnculAUMlt9mMzx4X7JYgs8X13uX4yAvQwFUEDVOE81cu90cH477Rd23kMZI8CU4
	L/RZLP1xBKaWk463eEP+4dgeZzjtuWb6lo2kD1JGiQGEKxufNYAmtr+AEqwtdKJMkdP79dhq3bi
	GbjAVUI7Psslom5c9lwSXpw2xlcYjG/N2CAZbSiRgXq232jHQZuDvkaiiTEUlzNiJCQ1DUQUeOj
	vQKcvPBGJ5iZ/tNyiZLOOaSTiWYaSObYMzWXw4O5JC/nVmo4sAOySeLSCDP2DuofwPK5g+WkWWS
	UcPHjNWqTo8+ZjxOlIOHdmiefsC6OwdOpExb1CrtrFLW0qjpAtfIYmH8oWFaq913YVJMh14HTCK
	NJqGDIIJH8UkxFmYCufYwnQt9W+NyznL0L7gr0EmOhGwMHvv8uA==
X-Google-Smtp-Source: AGHT+IGXJ0KnID9UZbw+fN4zd48wjafrQVEJxcSOQ1U/Ob6BwjbThrSHvvwYgUHs1ZO4rW36pVWFcg==
X-Received: by 2002:a17:90b:184e:b0:31f:12f:ffaa with SMTP id 98e67ed59e1d1-31f01300158mr2108633a91.6.1753686920018;
        Mon, 28 Jul 2025 00:15:20 -0700 (PDT)
Received: from localhost.localdomain ([49.36.68.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e7250db3csm6835609a91.17.2025.07.28.00.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 00:15:19 -0700 (PDT)
From: Dishank Jogi <jogidishank503@gmail.com>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	darshanrathod475@gmail.com,
	Dishank Jogi <jogidishank503@gmail.com>
Subject: [PATCH] zorro: remove extra whitespace in macro definitions
Date: Mon, 28 Jul 2025 07:14:52 +0000
Message-ID: <20250728071452.35171-1-jogidishank503@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cleaned up the formatting of MANUF and PRODUCT macro
definitions in 'drivers/zorro/names.c' by removing extra
spaces between macro names and their parameters.

No functional changes.

Signed-off-by: Dishank Jogi <jogidishank503@gmail.com>
---
 drivers/zorro/names.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/zorro/names.c b/drivers/zorro/names.c
index 077114ccc840..3e0e428a182e 100644
--- a/drivers/zorro/names.c
+++ b/drivers/zorro/names.c
@@ -36,21 +36,21 @@ struct zorro_manuf_info {
  * real memory.. Parse the same file multiple times
  * to get all the info.
  */
-#define MANUF( manuf, name )		static char __manufstr_##manuf[] __initdata = name;
+#define MANUF(manuf, name)		static char __manufstr_##manuf[] __initdata = name;
 #define ENDMANUF()
-#define PRODUCT( manuf, prod, name ) 	static char __prodstr_##manuf##prod[] __initdata = name;
+#define PRODUCT(manuf, prod, name) 	static char __prodstr_##manuf##prod[] __initdata = name;
 #include "devlist.h"
 
 
-#define MANUF( manuf, name )		static struct zorro_prod_info __prods_##manuf[] __initdata = {
+#define MANUF(manuf, name)		static struct zorro_prod_info __prods_##manuf[] __initdata = {
 #define ENDMANUF()			};
-#define PRODUCT( manuf, prod, name )	{ 0x##prod, 0, __prodstr_##manuf##prod },
+#define PRODUCT(manuf, prod, name)	{ 0x##prod, 0, __prodstr_##manuf##prod },
 #include "devlist.h"
 
 static struct zorro_manuf_info __initdata zorro_manuf_list[] = {
-#define MANUF( manuf, name )		{ 0x##manuf, ARRAY_SIZE(__prods_##manuf), __manufstr_##manuf, __prods_##manuf },
+#define MANUF(manuf, name)		{ 0x##manuf, ARRAY_SIZE(__prods_##manuf), __manufstr_##manuf, __prods_##manuf },
 #define ENDMANUF()
-#define PRODUCT( manuf, prod, name )
+#define PRODUCT(manuf, prod, name)
 #include "devlist.h"
 };
 
-- 
2.43.0

