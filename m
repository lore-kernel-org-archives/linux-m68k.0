Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CEC357A5E
	for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 12:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768222507; cv=none; b=OJD+AFndEPNtzx1SW9VezguD3HT6XuNiWowN7CEYjU9o1FqsCbHScWRTjcV+G7IbOcGRLzENkKEQnlOlIdPzlv1UIUVK+u8nrPn2aybj9G0ThORoHSUzEh8q7MHA9cy/DPHwgRvYeVWMPsGDXp8GuW+oCo2Oqqh/Vr38Su/C81g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768222507; c=relaxed/simple;
	bh=TCr86+g83B5jykr4uoI4MF4hOXPzr5E27AlUPYqmfnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=N+bF87Ssifue+QIHTWg6e7v/lfZOIBlfZ90YsSej4E9seSRusUQZMIJlfdPtOGpWKkImPojdxb/OLEg79S8jKTozvYhoUiEwhWM69jEkV9es02XDuO8jqoUIn5a9iTsECfdVufH0Ukf8wYnHXMNE0Ec//FUNQC7Cqk+tNm9CGDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KWPuhRf4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KWPuhRf4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768222502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rhxkLbdZYuCDIREBJ5aMnl1Pqa4kOCAZc2N2w1wi0pg=;
	b=KWPuhRf4mwVV8a1c3W2Z5Kjn+5z8sP9Gi6pJCGDwFNIJM40noL+AcIs7Qv06PnWqiRvpCp
	t6dLJgnU1qyfkVAqWABTUfSmV8xQkGRl32i5Awu1G27wpIxXS+6/1cIIkRHHHfT9HmTbeg
	wNqKjTBvfAE1fbtmIJ3MAuE2QJixnxM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-QEa_X6aROvG8EhwxDBhf_Q-1; Mon, 12 Jan 2026 07:54:59 -0500
X-MC-Unique: QEa_X6aROvG8EhwxDBhf_Q-1
X-Mimecast-MFC-AGG-ID: QEa_X6aROvG8EhwxDBhf_Q_1768222498
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b831e10ba03so935370566b.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 04:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768222498; x=1768827298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rhxkLbdZYuCDIREBJ5aMnl1Pqa4kOCAZc2N2w1wi0pg=;
        b=ULGwvsTXwvkXMZdM3eB9ZaIFYYPnIChtV0rqAetjDuPBBN2JHv8Ajbxeb+f90bvw6e
         2yaCy7Edm9ryyW7mh70a3OdNF7arWS5lWMBTa4yy1CaTZ0y9maZQ/OoKFS+6ZCH5Xz+9
         9srSLeD6zL5yT7EqUfkRTeVPgN6K0ewCEYrrEf1hPfkp5vlzENvAou8kbuFTNciIrkfD
         w0+Op1GCZWY3Yt9T4evVbBOZ50Qw2ik6sZo3A2wxOUVqFPUgT1za1Gki16iDMm++qi1P
         zCeQkr41yUkAufWCIQR3i6qnxPjBsiRZ2MlBTO/w/FIOFdCSzQs/Ry1V6INnFrGFb5Rj
         AIhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/6LcA/8hMCaDs9D6Ab3TeZ431NeNr3LEeSlNuM0StU2O3XXItkQMI2qr0DMlh0RPVL7+tFtRkhLuy@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwjZGi7fsNqN6Gnlnrrw5gbz59PGFp8WYqH2lB4CD40+jhmO7gU
	DN+MRE4/z5ux42A/7sh+eGc0lVHW3rRiDc+K06IGWoNARsLBYIKdqYlxku4hIehdl9i7VLrUJvJ
	7pfnjeTQP5TBhkqcO8Lq4fI8RGqbuRQe6uWtKQFrnCb2sBbDil2MJnlQzAj/0Y6Tcqz9vrQ==
X-Gm-Gg: AY/fxX4Dir4QqZX5kXFQwiWHiw3vYlZyygh1tTOjQ6M2JSCWGyICLMJcmGwY63zajcC
	9J936/36I0dh2MsRGu4NvE7jeNrUx2njA2IJamORsV98aNR5qab6M7N8QxasuRoBfZ74qvECVgG
	ykHZw4yhFJDUtYrYMUnpwhg1+XeC13UQ9Z7EzOylgfIEQTjXpFJE624W9cTb0gdATNooQTXLIQl
	GACrPtpzXC1vmuGrngCBMp1NgHQBXraeWfnvn4tjKeAiQHlXhJuh3WLMwggutjIP5WQvYd5Yuwk
	2z/aQryJ/wL3BGkOXw7voo63F4p887+O//yqrgiFVFRe/q750Eu7sC+2Z5OtxlPrmN/DI9Gv4yC
	iwbfq9NIlEXM14KGQn/xV6CbBblGFCQJYUDBl4W2RKn+vSjjwl50Z+buSqUo=
X-Received: by 2002:a17:907:26c7:b0:b73:a2ce:540f with SMTP id a640c23a62f3a-b8444c80f04mr1718742666b.17.1768222498442;
        Mon, 12 Jan 2026 04:54:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPr3dIgVWRsuP91OEnws2gf/Ukq1HmhAKZbz1wMFay2J0zyGKodjzzWjXpSeXa764C1KXgRg==
X-Received: by 2002:a17:907:26c7:b0:b73:a2ce:540f with SMTP id a640c23a62f3a-b8444c80f04mr1718740366b.17.1768222497991;
        Mon, 12 Jan 2026 04:54:57 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8706c2604bsm497062466b.16.2026.01.12.04.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 04:54:57 -0800 (PST)
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
Subject: [RFC PATCH 5/5] s390/configs: replace deprecated NF_LOG configs by NF_LOG_SYSLOG
Date: Mon, 12 Jan 2026 13:54:31 +0100
Message-ID: <20260112125432.61218-6-lukas.bulwahn@redhat.com>
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
X-Mimecast-MFC-PROC-ID: v_3lKc2mrhn1FrJRhadcwPRrD4TsnTh3_KkuRpF7-iM_1768222498
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

The config options NF_LOG_{ARP,IPV4,IPV6} are deprecated and they only
exist to ensure that older kernel configurations would enable the
replacement config option NF_LOG_SYSLOG. To step towards eventually
removing the definitions of these deprecated config options from the kernel
tree, update the s390 kernel configurations to set NF_LOG_SYSLOG and drop
the deprecated config options.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/s390/configs/debug_defconfig | 2 +-
 arch/s390/configs/defconfig       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/s390/configs/debug_defconfig b/arch/s390/configs/debug_defconfig
index 4be3a7540909..93721ca340c1 100644
--- a/arch/s390/configs/debug_defconfig
+++ b/arch/s390/configs/debug_defconfig
@@ -176,6 +176,7 @@ CONFIG_NETFILTER=y
 CONFIG_BRIDGE_NETFILTER=m
 CONFIG_NETFILTER_NETLINK_HOOK=m
 CONFIG_NF_CONNTRACK=m
+CONFIG_NF_LOG_SYSLOG=m
 CONFIG_NF_CONNTRACK_SECMARK=y
 CONFIG_NF_CONNTRACK_ZONES=y
 CONFIG_NF_CONNTRACK_PROCFS=y
@@ -327,7 +328,6 @@ CONFIG_IP_VS_FTP=m
 CONFIG_IP_VS_PE_SIP=m
 CONFIG_NFT_FIB_IPV4=m
 CONFIG_NF_TABLES_ARP=y
-CONFIG_NF_LOG_IPV4=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
diff --git a/arch/s390/configs/defconfig b/arch/s390/configs/defconfig
index c064e0cacc98..7750f333a1ac 100644
--- a/arch/s390/configs/defconfig
+++ b/arch/s390/configs/defconfig
@@ -167,6 +167,7 @@ CONFIG_NETFILTER=y
 CONFIG_BRIDGE_NETFILTER=m
 CONFIG_NETFILTER_NETLINK_HOOK=m
 CONFIG_NF_CONNTRACK=m
+CONFIG_NF_LOG_SYSLOG=m
 CONFIG_NF_CONNTRACK_SECMARK=y
 CONFIG_NF_CONNTRACK_ZONES=y
 CONFIG_NF_CONNTRACK_PROCFS=y
@@ -318,7 +319,6 @@ CONFIG_IP_VS_FTP=m
 CONFIG_IP_VS_PE_SIP=m
 CONFIG_NFT_FIB_IPV4=m
 CONFIG_NF_TABLES_ARP=y
-CONFIG_NF_LOG_IPV4=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
-- 
2.52.0

