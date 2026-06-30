Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47012DAFBB
	for <linux-m68k@lists.linux-m68k.org>; Tue, 30 Jun 2026 22:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782857301; cv=none; b=J10+53EsR5Winj0bTimyZK6hVJu5n3tYK/qbqDUGup/Lec4I50RupQSCakSIl1EPSm6L+fqHW/cvbUyZjbVQs0NybkWGl/qQWplgOw8vg8irTHpUTgWWF3/wUIXjti9i5pgMQCFn2/q+w7duXpKxBKbqe8HD1V/rkC9Utc/zhzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782857301; c=relaxed/simple;
	bh=XWXB5lkBc/phatIESF5YzvRqacHTijEtNRuYnvo2MIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PfhJso+2nCjRXUZJcV89rMsv35BCneUSJ3bJidv8VcNAB2GXnttcaUp4IVfzpMA9Sj8wPNGzv3R9oQH62FUrN8vPx22JK3gZyMalb/seEP2X8YvTFrYn1D/JN1I429YavA5WrhKvyaB5x9aZg/XF2CSbOGDcMPn6CX2FrV3Nh2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cCTN+vD4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kJ5xWTle; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cCTN+vD4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kJ5xWTle"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDd8b2920080
	for <linux-m68k@lists.linux-m68k.org>; Tue, 30 Jun 2026 22:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BcCIhz6+fnrglONp8q+fp9mef6PmcObbxRhKXStO7Qc=; b=cCTN+vD4HZwmI8lY
	ejqu7lzDeKTXwqFAMS/sTRNpvdMoMiAxUyoiJA4eFhpTgRLfRvMGXkbNO/sLcOq/
	Kr+o5qtLY8bZPydk48LmdD/QYhha9Mb3Zu6Jg+jFbz2OOi1lt4JlAnzouxfKRufJ
	1vGYuxgbkXfYsDebztJs91VxnfPK2OfyBaisU1JmguWpqdxoLPcaXic72syA9QUH
	lQgzTeaDRLIA5CkABN64XzCZrZhXKelOBhJ4L0wGngzhGDLoUE7KBunhksmwlV73
	6OwRuUZRp541lZkHdVRtlTvsEu9R7y1qiVobl6Ek9AO7twcGrKJzrgt8SbClgnEU
	dlxizg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvw8v3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-m68k@lists.linux-m68k.org>; Tue, 30 Jun 2026 22:08:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e52306621so446561985a.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 30 Jun 2026 15:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782857298; x=1783462098; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BcCIhz6+fnrglONp8q+fp9mef6PmcObbxRhKXStO7Qc=;
        b=kJ5xWTlei472vKYu3u/nm8K8aobRi1c7XGo07kwojMqsHBi1Licl4nAMYoKtAK6fe2
         PQAf9q2nfyELDDjW2yV39s+pavKnl2l0Z/VM5nhsg9ynz0CoPJ4+ewvtWz3NRLp2UEbS
         zEmnDWRX8g7+UhgE3W0+qHYMDrgV4m7V5gpu/MgnU9VtaRTWe0ApaTC1DBA9mKLjgHFy
         gZkrHPbIG/LlnpRsjPjU2L3yhHj62FEQveXu9fqRDRgD0nw2St9rR7T9dsng1A2tJ3gJ
         Z2d/VX3UMpLkzkCiDDuUuIEMe9AmMnM/GZgD2b8fZcwMQR/GmS4ip5QchOYqyk03F9lq
         Zfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782857298; x=1783462098;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BcCIhz6+fnrglONp8q+fp9mef6PmcObbxRhKXStO7Qc=;
        b=YWlEtphGzRuqVVMS30Th/Z9vI+6Q8+E8S0CeAFuuG6Hkx3Hmqm/Sp7T9f7dTFXKz9b
         zuzdhy/tbNiH8FBs6N3hQupb1UTB82kZ6YtMgBbA4dQPooznSQAxy4a7ZpOnXFf7PoI/
         p1Dm1zl/csl9GDe1r+6Yv7/P66odXInfzpkMxGnjTTKsLwOcAi6y1CmtQ5+/7G/q605O
         WvNxwXIn1GmWfKKNrv2PkhIflZA9NEPwoZHyiD8O1vFhCxVZgHN+J37vugQ8xo3dCw1c
         8hEV1Yy4iPUbvXUy+z35MTAGoYcDe0SF7IFgahwfiOkF0wOEvfsZpr3DaaSnoKFoBrA5
         gBPQ==
X-Forwarded-Encrypted: i=1; AFNElJ+MOKUFIXa8iTCs3XDIc/aPsX8Y6OlxXC9aYNnOignbffPikQHKPYtO9++zOvg0/l7Yy169WSdzimAG@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyWxbGC1nr24FVhNf0VQLfktjsfaVhhLw7Ab7Azu9JmULf7KMrK
	/2ZOygyLJq2FjLqSZg0ASmrfJoiFPBcjC5MRgme84K2jyXf23PrLcGQRvPd+p0tX6M10XtNBtlA
	5ktGdLhdtzwLmLA1YbceQkQDfcsBlU/wLEMCLwrDmsVkmbMNyEHPpNvuq/Ooop/QbxdaVY0c=
X-Gm-Gg: AfdE7clhFoUGTrJ+c4H/C6lZZgiSJxoFTuwZ3x+rJPcYjA9XodsdL1N9sAUG7dkl1dC
	nYbjMrjFbbpbW6eyFQJBYlRcbp5BnsW+fzUpFU7ynkJ9HnpN1hf+cEYH5O2F3u/jgZoDkukKug9
	YvHFpNMvM5FBMu9gXZQtxBbGlp5VtmLNB3E+m/JQBwWRTHRfxFEzj4Qp/pyJH/4zSGulC443BGh
	oeSi1w+ufvXtDCHzaJQASSIMKVprehP8f6vYOXV9NaObQKOKdJPzPVvfEgc5Lf5tOKd4lGAV/Jl
	eQCN1fJigg34d6Ll2NwXykFa+cTf6oa5K3i60qzpmuToK4+WjWDE6JLP4kUULcBsr7uphGgGDQC
	0MZ8p8uFWQYEyKc7ii4271jmPE4vYouzlXb2EKKxprpZeIm7XiG+P4ToKSOUicw==
X-Received: by 2002:a05:620a:25d3:b0:92e:5c56:727a with SMTP id af79cd13be357-92e627fa3f0mr909677585a.60.1782857297810;
        Tue, 30 Jun 2026 15:08:17 -0700 (PDT)
X-Received: by 2002:a05:620a:25d3:b0:92e:5c56:727a with SMTP id af79cd13be357-92e627fa3f0mr909671285a.60.1782857297248;
        Tue, 30 Jun 2026 15:08:17 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf26sm9903482f8f.19.2026.06.30.15.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 15:08:16 -0700 (PDT)
Message-ID: <9c94a0b6-a2e6-4d3e-872d-b1d3954a4071@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 00:08:14 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] mips: replace linux/gpio.h inclusions
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-gpio@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Frank Li <Frank.Li@nxp.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org
References: <20260629132633.1300009-1-arnd@kernel.org>
 <20260629132633.1300009-4-arnd@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260629132633.1300009-4-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BThubjNfa-jwPaMa3qKwb1TjZ7vhy5Hg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX6hWoyL37ED43
 y3WHDFhjVUp6P40WKj4VBsB4KH2sQA2vKv/B7NGpDFz8DhDzuTN0o5+2TUUKv6ILyu92xjJO/L1
 L/Hay2XcZr2ExGdU+0KGYLhaqzrFlCw=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a443e52 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: BThubjNfa-jwPaMa3qKwb1TjZ7vhy5Hg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX06UAjI2Gjm+j
 mO+vyQIzVdC4Fdy8veFSydolV8awTXd8m4mz262yQk0mFeUlj3FQVs7pR9enfY7GhqSNrPDL37h
 11d/5a0P3Eexdxkcc49HfiGp814oCQiM+Dq6fnTjl042PCY98s5NvrjzQ2SMOJxwXd0+DSxQrC0
 54nkjtJzUqR3SBJlbhYa/fieCRW6RLKMfndt7ZHuwHGgtzTmIqkUSgRGKA3eGr8qVFOyLgGwD9F
 b529n6tiNYS1vr28ZmztisjGLB64jE3kiPX/DdNAUq/aC6VlL9z9Uxd3QclKJKKF7MCssMd43+x
 GP/tEharZEcmjCvmx7fc8GvFXtWEjtVJFG06rdfTPW7ythhrYyYU3cDsIpsLhKHkwe4d3Jhkgdu
 qlepTHeKCQicvCbXEfl2h6MNRh58sHbrYuZFXFBEfGuE23cqChxkFTMLTQ7pEYWpSOk0iGpwRpH
 DCSgaupva3t4sb619Pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300216

On 29/6/26 15:26, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> linux/gpio.h should no longer be used, convert these instead to
> either linux/gpio/consumer.h or linux/gpio/legacy.h as needed.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/mips/alchemy/board-xxs1500.c                   | 2 +-
>   arch/mips/alchemy/devboards/db1000.c                | 2 +-
>   arch/mips/alchemy/devboards/db1200.c                | 2 +-
>   arch/mips/alchemy/devboards/db1550.c                | 2 +-
>   arch/mips/bcm47xx/workarounds.c                     | 2 +-
>   arch/mips/bcm63xx/boards/board_bcm963xx.c           | 1 +
>   arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h | 2 +-
>   arch/mips/txx9/rbtx4927/setup.c                     | 2 +-
>   8 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
