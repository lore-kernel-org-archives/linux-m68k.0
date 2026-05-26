Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C322400E1B
	for <linux-m68k@lists.linux-m68k.org>; Tue, 26 May 2026 14:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779805089; cv=none; b=iHjMCle+3CNcOuUwgQWd5ixFFygAES87qYu81VBiZ4KWrsQ0aZiutwJ7AKWkvPFQRsj0UBj3Jk8N6r7N5QHvxbHrVB+2NIyxYmJyBMocRVq99IDtVTFp/4DBMnr4KiBiJ8j+f0OfLHTZPYYI+xTK0ZT6o1Jj/RTS5edDVUF8Sig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779805089; c=relaxed/simple;
	bh=A14j4ivDNBl2yGcg6n5ndH+ByZLqjyYb/4BbZyB+vg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LsJAEwcP7Ugx1A8KFk1Fctd6c8PGe26iJV1Ozs1Iza/7VJl9Js1f9FbPf+bUlzMsrHNGHnhKjVQqili3XIHuKN4a+LicavzU8wuY5AhJ0zzPU9LcibrVtbiychVCJhosAD3k2JLL1tfa/klz32UUz96lUh/7WutWUSLp/ffpcwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HmRoB0Wb; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HmRoB0Wb"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4904fd4f6aeso30332625e9.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 May 2026 07:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779805085; x=1780409885; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWA1rx79U563LTGj65VSgfxyjti8CkpfF8kpzyqUrdk=;
        b=HmRoB0WbM3hpP5JdT3rSKX9wqumgNwbz1gjM5gxSnwT149GhfxHCJ5Zvc/XxjS+70e
         ixaEhNfasCseVBAxsZ8/f4ZCqAt4lq8Yjg01KpBN3GLfNKKo7noqKuvm5xnBGK4+2GII
         ZlqjsEHXlB5LbLRr/Y2t81ZmoM0i0L8CRSqHDnYGm1iFjOgCPWWgAfknFrG3g64eeNwI
         RxATDschhUaEttEo14kGHWwcBl+5TTFIWLPpoyDe+78797t6JgT6/Iwj0cJzPbKTzApu
         Q6W3vnDrGAa/+l3LKmhKFiSWirPUDHZ2lXuLCeBWS3+N0JHnz8AIpwAt9AAXxOo2C5ES
         Jo+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779805085; x=1780409885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DWA1rx79U563LTGj65VSgfxyjti8CkpfF8kpzyqUrdk=;
        b=V+WMOYJCTD1DM3wJfTMbJA+QQEW+GXFkOEiVZl1+JCl9XuobVpEtWuQ3SHrCrxAS1v
         lTVumuiRc80aaYZpz4h26ikK+RfFc0dxfXCaaqk0swyosFHrttFHhdELHVzSMa4g8MHk
         ndNPqPPdUFSdP1UiM0QZDnVHjCyD8n0wbRch3iMdH7K1+PzcJ9tq2kJY8d3G94nWP2zo
         EEAGr61ab8nGIDkzaHZmMlKI6WgxWBdFZIVyGQ15elo3vusEJmP+B40ZClTAVdg2xgxB
         lU8WA9stzMO8j9++NnlBe1GguL9GWMWm/AiB+wFgdMJSyOKmvE5g9fRWkVJrHukWfjr6
         AOaA==
X-Gm-Message-State: AOJu0YxRimz84rCFCT9gUG9VsxtTDYZHAuuU0oiVDI2YK5rORgQMSLxa
	SbPkUkNr9UKY+cX7Xii0LlqbDF+8rGdfV9Phhd6sf4LiucWBy9vtreNfafXixT61nlg=
X-Gm-Gg: Acq92OFsKXMGp4YAZW8UZfJ0Zd/a6Rxcis4M+xou+Bq+BPtD9a6qtK3xl5P+RAR3E2I
	NLxWBxKDYMyNkra2E5QvuyN4zsoKCPbzDqNjSlIbhrKiD5u1uMb4oMnPBarVbnSYTZN6Wxdwq5t
	ZZx86nJt1Y0lkyzaXS14DBBv97DoCbTZmB2cUpg/dRahhpl8RujZK/Q13pUC83s5jaEfZKPalIM
	mJbx+PykNC5piUHWH/SpLPbOAyrTuHdt1Av6/3oITYs6pyqsG1ZEEvlQuaXvxu4SXT4+wYTrPE8
	Qp9WXWJ5qrRo2YrKZ/J7cCd52e9TCxP/CESgZp8a9QbL2uN2ig53ctVdr/Yay1+81Z4f3Gdw2JU
	UZDhh+Htsl3SqFMl+QwcYbu7JVSChlQFz9+eCpHogAT+UFTC65T/lEh2QttGGfRkIca0QmbUpD+
	98ssO0gaY0HcTIHb7RiUt+Q7UwyP3xMTabT12OJEa6v29xJ4KIAjRh7G0a7OLMWfqJy+aaXkrb4
	1Yz+EB/Mbi3Hbn7Eli7iLMGOA==
X-Received: by 2002:a05:600c:4592:b0:490:6237:5213 with SMTP id 5b1f17b1804b1-4906237537cmr145220735e9.23.1779805085104;
        Tue, 26 May 2026 07:18:05 -0700 (PDT)
Received: from localhost (p200300f65f47db04a716d2bdeddb4813.dip0.t-ipconnect.de. [2003:f6:5f47:db04:a716:d2bd:eddb:4813])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4904561a160sm379625175e9.9.2026.05.26.07.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:18:04 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Max Staudt <max@enpas.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Helge Deller <deller@gmx.de>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	linux-ide@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v1 6/8] zorro: Simplify storing pointers in device id struct
Date: Tue, 26 May 2026 16:17:32 +0200
Message-ID:  <49576a7501128c93ef318566ed7faefce163f1fd.1779803053.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779803053.git.u.kleine-koenig@baylibre.com>
References: <cover.1779803053.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1515; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=A14j4ivDNBl2yGcg6n5ndH+ByZLqjyYb/4BbZyB+vg8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqFauEMCO+XO5wBiq0WLDW9CPIg9uJbXOSVo41d x54C4q2mLiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahWrhAAKCRCPgPtYfRL+ TjnnB/9l+SDbdriw4+P0R0QawXzQR6RNcTSEDOsG0Za0QxbkFa85XMb5sLwAO0owuw/Rowx6ky+ QMdsAXUgR3vwvQLdxYJlkEl/VA/XHq/xJJAuw+YZlvI7KLvHFN3YqbmJgo+fHO56QX05JkYBvJ2 Jk9WKvtvJ58lFHkr+5etBSYF3AixiJ+YBuoVcvjao9lM8EjUJ8SyDU/sXtdjUltWSXQmsKSN5Wa cffVeDubVIqpPQNOIDt4M8130VMFMoHEz1nySiOBmpolGD4C9tykhh7r5xGVttivy5+fc/p6kFl 64ZyNUXuXtZrf+NrGcA7ZEOvBZuObVE5B7q9XxMf4MX80c3s
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Technically it is fine (on all current Linux architectures) to store a
pointer in an unsigned long variable. However this needs explicit
casting which is an easy source for type mismatches.

By replacing the plain unsigned long .driver_data in struct
zorro_device_id by an anonymous union, most of the casting can be
dropped. There is still some implicit casting involved (between a void *
and a driver specific pointer type), but that's better than the approach
to store a pointer in an unsigned long variable as this doesn't lose the
information that the data being pointed to is const.

All users of struct zorro_device_id are initialized in a way that is
compatible with the new definition, so no adaptions are needed there.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 include/linux/mod_devicetable.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 3b0c9a251a2e..2673a1bd82c4 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -640,7 +640,11 @@ struct mdio_device_id {
 
 struct zorro_device_id {
 	__u32 id;			/* Device ID or ZORRO_WILDCARD */
-	kernel_ulong_t driver_data;	/* Data private to the driver */
+	union {
+		/* Data private to the driver */
+		kernel_ulong_t driver_data;
+		const void *driver_data_ptr;
+	};
 };
 
 #define ZORRO_WILDCARD			(0xffffffff)	/* not official */
-- 
2.47.3

