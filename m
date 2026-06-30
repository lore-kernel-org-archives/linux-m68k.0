Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6753932B11A
	for <linux-m68k@lists.linux-m68k.org>; Tue, 30 Jun 2026 22:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782857400; cv=none; b=SfJlL5y7dm6TNT5nFC2g0PhOMPhLfS7pEcuOyM4DW+/harL+XJhokBBObLFLiGgn5c9zqnagMAzdZcb1s1u18E0twvS51sQce9bmzceXArJUo3G8DlRH9skD/v5Q3Duh1zTdGcmP1IZs8nlAMCAkiG51rddsgURhQw8Li1oexqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782857400; c=relaxed/simple;
	bh=lka07Gr3l2JawsdDoDkCfszFn1o8HA7+GaDRSGzKdLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PZoZy9oPGWW9w7Vn+N7w/codJB1cT65gKc/2Yi+DooGsqBEeWg1sYqS9TRggfAQoNwnP19ztDEpzEkuK8T9HgAFYs40mxUz/yRyuEvmnmdC2Caftej5JzeR6SXlrHSw7AS28+E7r8+wFRUTOHnCJto7NdhGIGF3mb0EPH+yXfa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVVUyqEg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VqcfN8fi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVVUyqEg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VqcfN8fi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDb4M2873463
	for <linux-m68k@lists.linux-m68k.org>; Tue, 30 Jun 2026 22:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71yptdqayaVFzpJtAQzWI+qpR5NfHXrkWbz9ikn7Ryc=; b=UVVUyqEgI3aai44H
	QkYs6h4Sk/6/uPO94ctKOtJjj3n5+wTduu75T3lBINHDzCPeXdCe/LLgdz4BiIIA
	I6FCYJGuW6rbqCzG+PqGMHpMb6xjJcmfkHJt1PYgP/kntODh+X0VaaTTgDbDdP/t
	5mK6QuZEI5QJqRhPc//Uvx2PsEtojBE3Wf5jUoCGbxwxji82ZKuqfAGOBqi/CtJM
	MHsN9S66aTzRxKSc9r6r3jxLGT72P0S66dSuzw/gjfRycE/zeF8d/az8b9/+BxqX
	uSr2XsXere5zlNsaYwMjPVwz06xYAC/u+oMsdfeWvyWqnAZBEcPGno6XGT0scTZD
	4sRW/w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3sgung-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-m68k@lists.linux-m68k.org>; Tue, 30 Jun 2026 22:09:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ef8249f73fso943756d6.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 30 Jun 2026 15:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782857397; x=1783462197; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=71yptdqayaVFzpJtAQzWI+qpR5NfHXrkWbz9ikn7Ryc=;
        b=VqcfN8fimgN3i0WKEXTzniWEyG/0J+rCfxxQqfkaR7z0H4Yuxec5UuddSpp+/6TiQF
         Zu1bZk4cqkK+DohEY5fBWtSyBTRu7+89XrYxdAAF7cmqtY+3xsLftll65lDnQCRVjipU
         UwczE8xARi1JXd42jhbxFcgVhN+azDZOjHlGuDpW78rruaumt7f521PGCxj27GNEsXVL
         rrzduSst245VI3mMEB379xa4MsfV5MN86ItAzR47ttEv8BiLO3nM09d0jHbN2e3hcuKW
         4iDym0EbA8TJNkQW28oe2litCLUZlAGhPPHpEX+pt0faqXxDa94U48nSxwAi+J0D3Um5
         IFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782857397; x=1783462197;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71yptdqayaVFzpJtAQzWI+qpR5NfHXrkWbz9ikn7Ryc=;
        b=i/4PlIeNJoP6eY/2leDdwyCsmFVvFw/tNfNg1a8v4OPuvuKL1A7Lw5MJwmwMGtNz87
         HIUnk26l/PKEqe7m2yaA2SphLqZ9bQm6Wd6MiSZLSEzNu33MrZB/v1Kybty7BGTl8uIF
         URnYHFhWHU64lSeOfYFc6bwXOtNR2Z2ZnPorJjRc00CnxxC1WkfMMPJOaPDOChtJ46qL
         73j0A9izDLi8QoeGbhSFbF1kIv0AzZm895uJVy4b5Bw5CGWYwzogwOTVckkJsqP6iQKp
         RmDwv2hVDBr2S09qOPSz/9eB/27mOvbueZAtlbBTqGNKvP/nYbv/H5Si4o53i5Pj9ePh
         fqyw==
X-Forwarded-Encrypted: i=1; AFNElJ8BfG8YKJvLWEU7Vm2rGyg4L1dDZpdT0QnX5xFdZcWoe+z59Q19P7dQr0B+cKQbdD16l3MST7KGsOL/@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz9bDpKJMh+TXJ7DOrvc3LLPPQyTKbfDa+bIhCosbEfugfT3HIl
	Hp+0X6WYnx3OZASDi8AKUXKvKwQ2mJjRaZJdcHQBDRHXefdcuQkkQh7MddE8+R+pNJunL0l+abL
	8atcnGtpwct/jCru0kMPhedBd3qAPAhmj3WjZhFGac+IyFTzREJTtAvI2n6/gGHT9tRIDcrk=
X-Gm-Gg: AfdE7cmxXXtyRUKKYnjX82a/Pwlbp78lHHc1iUK2z5UFjRlvikXp0rlbqSAWJN2uOMK
	a1nQOYUpY9El4XEeFzv/Gw+57nNVjaVeh7lP9lwJIorqLe+7bG2G4Lr727PBcLncIcxLJi7Yp8Q
	cqUqCpkSMVyD/JMRRJzhYrVbrmkztDpogpa79vi43SppH/zlxuBZxmOBPtZnYK5n3KbJSE+A8q5
	PmaLSLLox476KDki0wuLt0QxBHdrz4GGbW035sE8VrcTbjJZ3s1v0tbqa/ctVKB5LHmOrbE6YNe
	NdIWcA8uuquVW9SK4os03Y8ypWQCshfopD3C8zH+yZdSFzE87ZTewqAKds8HNO7EeFFiTkmURQR
	qSihM3CE7Wz0geQywjtkCaXaSXn25SUc06KkPvQ1ffppTKw6viFe8ust8SjRIPQ==
X-Received: by 2002:a05:620a:468c:b0:92b:6805:918a with SMTP id af79cd13be357-92e6d926a2cmr434243485a.66.1782857397403;
        Tue, 30 Jun 2026 15:09:57 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:92b:6805:918a with SMTP id af79cd13be357-92e6d926a2cmr434238085a.66.1782857396955;
        Tue, 30 Jun 2026 15:09:56 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d195b3sm11865243f8f.8.2026.06.30.15.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 15:09:56 -0700 (PDT)
Message-ID: <caa30078-9dd0-4f07-a206-2dcbd2ba09a1@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 00:09:54 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] gpiolib: remove linux/gpio.h
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
 <20260629132633.1300009-14-arnd@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260629132633.1300009-14-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wxbHiCjApjiZAz8bIzFzNIiOI07r5gji
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX6fHe3OU8BOzb
 pKI9v+1fQGhfE0NYreuss4viApqu/7wsj5FTxCAoggzRBMGcHnL1RyhC2g1KtKgIu3iZICG/8S2
 B7SG/CaILz32zhW1DvKr0JlVjeOZCNPuMOuI0VuHUAXHlW78a3x+ftTCMaDJ6WqNzTS0G3FVFFC
 /5QgKTnxhyYns1U36zaZigTbt/SSd3F/YJ4z7HEVxsWXZkK0GVfdGXPr6YpXC+XT+Kxvy5u5hZ7
 /Z6W87/FxBISFVJW/NFSXQIOVnCfrxKXC5wUxBb1xwjmEzA34rPw3kxsci+IE24LV/PsnrpgbiK
 XcOEqLag/SRh4iec+uQYshdWVR37F+QFDS4L0QX3MpgfbDbR/2H+PyEmiEl0l7xNi6usggzwuaS
 ozlgqSP1G9HXwLpr/ET9Lp6RbRnX7s9oIBp2XUnd9IPyEOSAZm60mHWrGqKv0MNHTFkhS09CL7c
 vfzQuAuGxhyuveuYPlA==
X-Proofpoint-ORIG-GUID: wxbHiCjApjiZAz8bIzFzNIiOI07r5gji
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a443eb6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX7yWz85wXxdLp
 u1cEv82gBOJkDYI9OXT3psrkXpPu6gpn4jiyEyMwE8j76H7exjkJ4DhfxzN3CnatKUti+s8DWLm
 Fd4xX5ay/IFy/K+Tx0jeAtJptCt34oY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300216

On 29/6/26 15:26, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> After all other drivers have converted to linux/gpio/consumer.h
> or linux/gpio/legacy.h, remove the final leftover bits here.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   MAINTAINERS                   |  1 -
>   drivers/gpio/TODO             |  4 +---
>   drivers/gpio/gpiolib-cdev.c   |  2 +-
>   drivers/gpio/gpiolib-legacy.c |  3 +--
>   drivers/gpio/gpiolib.c        |  2 +-
>   include/linux/gpio.h          | 22 ----------------------
>   6 files changed, 4 insertions(+), 30 deletions(-)
>   delete mode 100644 include/linux/gpio.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
