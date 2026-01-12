Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D7F358D12
	for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 12:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768222501; cv=none; b=AohWYnn81ox3uzxaNd1nGD3XIOhAJKcMzPsL1MV4AhT0vX06g4cqK603a+oqE2w3ybFieto3goLNdI+EFCABtMLO2anFVx1V0H00ht9VVFnFRIkR8w/qbKfl23qukXtU0nUJS5F0VSSeyl/GOmQ2FT/griBXpgzUGltQclyW3tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768222501; c=relaxed/simple;
	bh=9AA+6Xkc06ZNRttRTO7oNESMzk9GkeD69hB4TdB8dWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=BUaCpJLFHH70h6QGl4Xuv0QcoICFpX6B3E9ne0OeNRYj/C9qyi8yYnhRXM5YVRPnPP7w2onW/p9LbA0LeHIlaAqso2XNFw4Igm8o5R88kPKVLqk9pHSrqI6BhbJ8Wh9EtDJnvgf3Sb1gZFvFWzA3ra9wjzGtPwYxbA2pTk4nqu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YRo8PJr6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YRo8PJr6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768222496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aw/NV8LRyH0v6ORkecK6sJJhDNFc4SC6s3IiJQNZsCk=;
	b=YRo8PJr6+SGZWUpCfYNW9zLKix4NQVEtnnthrxO3vCv51bN8YjvoAZTK00SrCpBDj/JsUz
	GCZZLCP+vbetIPVWTQdsinhz4dUvQ1rsYfGkWbTlOouGrTkVVvWhHghN14AlsXk6+IFQ05
	0DDg0BBNo9sVc+8HIxMeIFIx+OcIZ9g=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339--Q0Jh2BcPr6wxgQwoJWPpg-1; Mon, 12 Jan 2026 07:54:55 -0500
X-MC-Unique: -Q0Jh2BcPr6wxgQwoJWPpg-1
X-Mimecast-MFC-AGG-ID: -Q0Jh2BcPr6wxgQwoJWPpg_1768222494
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b870d3327baso108103566b.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 04:54:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768222494; x=1768827294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Aw/NV8LRyH0v6ORkecK6sJJhDNFc4SC6s3IiJQNZsCk=;
        b=dFRsz+hHd/GNqHl7tLlNY/26XWbJTO0uqyPatmwsnEGqMtzPCBhW1wI9xOAWMmlY8i
         NhV7PjIDKwd/3iu4x7P+B0FEFNDD+uliqjXfJ3NKRWB2NwEwX/tQiBd/YclqV35R6Hak
         JjRn0EEwy0VtjwpkANn6CyBm687FUhy5eQLAzoJYF0JTlBpFM22JzgegzyjuPE7C7hJO
         3u7gGVm9EaAq5MzLbThJmTzQVeKT3Rvx3wqeQCm3abXOFnIcl2ubEVzjiJScwkqDj1LV
         nxDFFkmq4AspGuWi/HBIsneu7jY7rw5xxQPXA5q9+RbhGAMuJmc4Tdo34ZmW5iYN4QHs
         APkw==
X-Forwarded-Encrypted: i=1; AJvYcCUGI7/BurAhxg06fyLPrMHuq0sKhRioYX86/Q7ER/p5toEfnwkvtYOLBrzGMIY1xCTBOFyXR3PuUKsp@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw//MesTsuWGLtPUks6ZOPfehaaLMVyIrZl5QzUvwLbK28wScc8
	N4VoofGsh9rqnV/TPy1F2Y7Xn2ZAeTShSMy+lS6S3EPl2/JkMu2O5twnJ1hl8f64A2mwDLCL8bf
	Q21Y9HKya7Y6iCwdyiLJNbtPjw9Q8qGzbf4ueLy4FhOsQPTeP9v2/C5/bkZWyWTC6BLYsSg==
X-Gm-Gg: AY/fxX4L3f0fPbHb5iVH6EGuBtArqWjXVta1eJN0dyN9onekcdtz8pSYe/LP9023g1r
	gewNzEoJEQVvl3AEgjJY4Vg1A/IV+FIpCAaEKQraVvmM2N78Po8byUCWDoCMbf3LXqMVeW7E86+
	aChTAUDNlcTXX8c7011scjRYH/P5Ada0qz/P2wlDYvf6UOnQj1lJJL1/sRPNFrxPFFCMXymACj6
	R1wfXW8BlMYAtb/tix/y81xRmXvup9Z70234G8vjCXE9QGSxwJ7cvHh2Nm6+TPw8ZotZALyRCMu
	FJuouhUin2tZh174svNQF9eInb5C0OmLUKB1GE46EzhzHRkINsWfzJ1GBa/9yw0AMTjerjrG5bo
	nJWqWm/5mnnXDYalU58JRRNCJJKBXFE4Du30e6kapI/ZzJ1DtLAIbEbj6Q18=
X-Received: by 2002:a17:907:b59c:b0:b86:eda4:f780 with SMTP id a640c23a62f3a-b86eda503ffmr427900866b.18.1768222493911;
        Mon, 12 Jan 2026 04:54:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQQUtq3Zy/c64KpzKtlRB+1NOLYJQC+enp8zQ7vlFIka+NmHMqyup9Wyx1StgQLyix4fqkyw==
X-Received: by 2002:a17:907:b59c:b0:b86:eda4:f780 with SMTP id a640c23a62f3a-b86eda503ffmr427897866b.18.1768222493414;
        Mon, 12 Jan 2026 04:54:53 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8706c2604bsm497062466b.16.2026.01.12.04.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 04:54:53 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	David Ahern <dsahern@kernel.org>,
	netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-s390@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [RFC PATCH 4/5] riscv: defconfig: replace deprecated NF_LOG configs by NF_LOG_SYSLOG
Date: Mon, 12 Jan 2026 13:54:30 +0100
Message-ID: <20260112125432.61218-5-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112125432.61218-1-lukas.bulwahn@redhat.com>
References: <20260112125432.61218-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iANzVfBz93QlfbB8UK4MH_G_E3JxROar6WP5bbOj8lM_1768222494
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

The config options NF_LOG_{ARP,IPV4,IPV6} are deprecated and they only
exist to ensure that older kernel configurations would enable the
replacement config option NF_LOG_SYSLOG. To step towards eventually
removing the definitions of these deprecated config options from the kernel
tree, update the riscv kernel configuration to set NF_LOG_SYSLOG and drop
the deprecated config options.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/riscv/configs/defconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index cd736a1d657e..0b99a73f43b2 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -64,6 +64,7 @@ CONFIG_INET_ESP=m
 CONFIG_NETFILTER=y
 CONFIG_BRIDGE_NETFILTER=m
 CONFIG_NF_CONNTRACK=m
+CONFIG_NF_LOG_SYSLOG=m
 CONFIG_NF_CONNTRACK_FTP=m
 CONFIG_NF_CONNTRACK_TFTP=m
 CONFIG_NETFILTER_XT_MARK=m
@@ -75,8 +76,6 @@ CONFIG_IP_VS_PROTO_TCP=y
 CONFIG_IP_VS_PROTO_UDP=y
 CONFIG_IP_VS_RR=m
 CONFIG_IP_VS_NFCT=y
-CONFIG_NF_LOG_ARP=m
-CONFIG_NF_LOG_IPV4=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_TARGET_REJECT=m
@@ -84,7 +83,6 @@ CONFIG_IP_NF_NAT=m
 CONFIG_IP_NF_TARGET_MASQUERADE=m
 CONFIG_IP_NF_TARGET_REDIRECT=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_NF_LOG_IPV6=m
 CONFIG_IP6_NF_IPTABLES=m
 CONFIG_IP6_NF_MATCH_IPV6HEADER=m
 CONFIG_IP6_NF_FILTER=m
-- 
2.52.0

