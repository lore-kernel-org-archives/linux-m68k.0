Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFF813BC39
	for <linux-m68k@lists.linux-m68k.org>; Sun,  5 Jan 2025 07:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736061305; cv=none; b=WsJz6Nie7p0oOEGYhzYkB2nwZz4cizGQJ5HtmJNDWx7+RDu1/H1zqqUQczzP8JXXBCoXn5nQG12qW9q6DmwPp7GBrb2hT0+FMcteMzYZGdO1AwmiynwEZE7vP7V6AH6Fh1eIHRR1UypdPU5uZcwUW/GAAqQGWgIuU5qG/wmY6QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736061305; c=relaxed/simple;
	bh=bAVYeRTyH9it2XS91sWRwPnXF5Iq5evkQGxyxsDaqC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bGWwp0LG5tp9UyN6MtQZeAWsoewv5ZlrkEsXZYKWGSht0F+COkPcn1EW3Ok4DjTvArgCU8Xgend2k6S/EXM2nNo8DdsDL+oDUfju1VgfzbTvn3v2nRGVJ+9gaOro6P4B/Yfg0B9hoLcxr7q74u0aZRyrLkBNY8dK13XkT3ZGIAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=llx2vxRc; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="llx2vxRc"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2166651f752so221932665ad.3
        for <linux-m68k@lists.linux-m68k.org>; Sat, 04 Jan 2025 23:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1736061302; x=1736666102; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpFvK9eU/t8hNYDP9XQWnc8bXb3AgTnRlyt0Rp6Wxv0=;
        b=llx2vxRck+1DYWu6hpJaGtmmSDqWdkwGEeS3+3SK/Ur77DWeKiku7OtMka67XiUSZu
         nzpvLNtDjlZv9I5kwyqWLgWSfWFaryHsb5DYFKJhIQ76710Nn2pc2JnMiXUoaTvKhMbX
         O5nYEkJwk05jqRRmpKN+fkCEnkXcRzbpsMybs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736061302; x=1736666102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PpFvK9eU/t8hNYDP9XQWnc8bXb3AgTnRlyt0Rp6Wxv0=;
        b=g/aktP39aqeiqItGnvA/NthqQRtA5L8FyQf9FuHwEbhONV8yJicGSUlRAFuVALG70M
         3i6fTdtwsOWQTaUoRMsncYBcVyupN2otoTksxNsI6ofs65+ELwUd15qVBKNL25l28h5z
         q4+1yauVJyGpSaTGgHtHJGMUR6PI/sOBQoDqcr+jkW8AdgMPTzqMdFTEYx6tiCDBMtPM
         H+ydosprgz1lFcRNW/KiA73J+lxkJalYBtcmBoSR+iEs7uXpHrr3DZpB+MCR39AJowQS
         kZfluu/X/IxoeXd9djuOygomOQzCplVyFZGMqB6KYZVEjVnPiqKUuZQgsdNKsKt6K4Js
         ZKeA==
X-Forwarded-Encrypted: i=1; AJvYcCV+P+ObTcWS+Wvygt5+Dv/349HDrggbQsNUicBYr3sYiYrg60vFn9/jH8rcvNC+gzXoEMuFFaTvyvqA@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwEeH5JYdDYHpZb2dLGNs7/NukwRwxqb6Oz9LPvCFx762FSmLNM
	3E5lYCOtbLPlaTGvyj+dPRUo88KWAVoFZ63fh8qAqdp/CY2F0/VOaLk51ebCM1qzpfl2cjqWeFt
	m
X-Gm-Gg: ASbGncvP4uW2nl8AtvyNADQdJWZpnJVhPjIw0Sn4K4uxLUDEoU3K3RQP770m/q81ggC
	FecRjMN7JHmWmc9SaZVHOhfSlks9kpOruB7Yb3Qy05VqQzGtBCx9TS+fEIwLtAx5rF8aj82I8v4
	KZipX1zhADu2aR1BTCZabJiHcpdMbmgKx+VW7wRTmse7CQU+C697J7pwOJCiubqXlGTjKd6icIY
	/fCFgH8HeMKVPwW+WiuGLeKNz5njxcVizZ5eWGM3dhAqEXiii8oKLK9CcTBOxHnz+Ci
X-Google-Smtp-Source: AGHT+IFwrFNGCjXvHA5ahmFCVR5GMznwulJmCjkk5vSaS+IUbcw2meg9QsPp5xP+vRjtp/TJRqFUTQ==
X-Received: by 2002:a17:902:da81:b0:216:61d2:46b8 with SMTP id d9443c01a7336-219e6ea1c0cmr799287015ad.23.1736061302129;
        Sat, 04 Jan 2025 23:15:02 -0800 (PST)
Received: from shiro.work.home.arpa. ([2400:4162:2428:2ffe:e94c:e5d:106e:3582])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dc9cdef7sm270007125ad.133.2025.01.04.23.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 23:15:01 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: geert@linux-m68k.org,
	fthain@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [RFC PATCH 2/3] m68k: bootinfo: Add generic machine type
Date: Sun,  5 Jan 2025 16:14:32 +0900
Message-ID: <20250105071433.3943289-3-daniel@0x0f.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250105071433.3943289-1-daniel@0x0f.com>
References: <20250105071433.3943289-1-daniel@0x0f.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a generic machine type that will use an FDT instead
of board setup code.

This will allow the bootloader to just pass the generic
machine type, some memory info for the head.S code and
a pointer to a FDT blob instead of a specific machine
type and make adding new machines simpler.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/m68k/include/uapi/asm/bootinfo.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/m68k/include/uapi/asm/bootinfo.h b/arch/m68k/include/uapi/asm/bootinfo.h
index 326f20e82769..e885bbc462d3 100644
--- a/arch/m68k/include/uapi/asm/bootinfo.h
+++ b/arch/m68k/include/uapi/asm/bootinfo.h
@@ -94,6 +94,7 @@ struct mem_info {
 #define MACH_M54XX		12
 #define MACH_M5441X		13
 #define MACH_VIRT		14
+#define MACH_GENERIC		15
 
 
     /*
-- 
2.45.2

