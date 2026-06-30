Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCD33233ED
	for <linux-m68k@lists.linux-m68k.org>; Tue, 30 Jun 2026 22:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782857332; cv=none; b=HB3xVGNqnItd1FchRXQbY1EaTByKJ8TSNXLfTXvAjZ9wJHRXdm1PktHpzJaHeVZz89dE42dPERd+SPUaeRN2WhV381FMgDRgLXlP5scRDNFJ4H2bXqehUCfcLN4XqKSKOr9PdvtvQDr8ZMCVD63Uh2SufgP2E081G04UmV/dru8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782857332; c=relaxed/simple;
	bh=eyMPhz4D72N34DaHLBk8TtAHe/1rzGfpY/U34NdyrfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UwuqsUbgR6dgrp0nYYYIrnqP741M/fgzS6YkLUpfNfSvKVmZVT3mRuDT4HxvjzSaSbekzruNwwgmFFfF/hd6spzsBvn5ZAeZhLSjUbY6WLqOaS/e/v67cVYCFfQNVWmJNBsuPPVViiOCyZw952083qOutMs+QQMws6Ktes9EnXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YjdrKYpV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aiX6ufDB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YjdrKYpV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aiX6ufDB"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDl8p2880124
	for <linux-m68k@lists.linux-m68k.org>; Tue, 30 Jun 2026 22:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X1ZxiCoDe6QCyz0498GlQmGlGSpLwZNnkWsIqh3kavo=; b=YjdrKYpVqZ8H9XAX
	ibF7vH/kUADBSYjVGZClU63lnyKF8JVv5GZII67PEhUmScSfLZEtlySCd/8RXj6x
	o+rkx6Eto9cTsN3V7OIW3H3NJVDGsBpAi4uBgzMTXdfS8EGc3015nJ1/UL2kEZ4+
	BA9iwT1xYJSu51qvtJlUaI7KWY9mpv+Zf/4q7MA6Zp7fhxha5a52zn6FeCol17DP
	00t0lcWini3dby7PAFSuxWS4FE74H/bGbkax08nYfIc7ANpPU3ABvUKZKfwTZ7uA
	3ZIoFEoYf5v4XPixYIG36bcjUj9HG8lp6iaVzz8ebgdDiRlDt/46JVeyX2EfpF/f
	aeUJpA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hfy9d66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-m68k@lists.linux-m68k.org>; Tue, 30 Jun 2026 22:08:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8dae6572676so324006d6.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 30 Jun 2026 15:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782857328; x=1783462128; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X1ZxiCoDe6QCyz0498GlQmGlGSpLwZNnkWsIqh3kavo=;
        b=aiX6ufDBJH3sWG80S2m4bl+Ak0R0f1jCUmzif3e3Mh5ed6fSzBR6wDoOqJ5e1NgPn4
         wNW5T92x1477QpX5TapZ4oLwPZ4E9fE9Gx0NOUB7+/ciU6o/c6rTT5C8DeEqof+RFim3
         HOAenBuCgX+VBbPAxUl6msF2FeEIk4VTsgFVJlaah5BG0ga1y0WpEIYFA254uPXAHkFq
         36NnAKufuXL0+DypW3ZzQBUQMzHZp6HZetbhNig9N3v1FhEyEOQ990R4anzTzO9M4GtK
         NZUigmPgdrUuSje3DFo9VaGphtvk13833I8mmNoZa+D1fWvWzzc3eHWWCNeFac6a/Lu0
         B9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782857328; x=1783462128;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1ZxiCoDe6QCyz0498GlQmGlGSpLwZNnkWsIqh3kavo=;
        b=U4qJxD19pj2DRT73xl5I01SDZ9qZozCC9/znXuROxB7iy0qQdtHaJH21eFVoBWLeA5
         ukrNpGrU1fGpypSx+TQjcB9z52vv7YXAWXrFa9twlQlWSZ7Ube5s24pI0J8kIE42dO+G
         VYATdfFc7lZjEYmEMu3oPKVpraNMcNSLU4DMJOioMmd60KZgPVTF5w8Kpl8mLlDaex1C
         zdQP8ZlvlP2rHbH15Mi5KxAO4zC5I+8puKztS3dk3gtC4OL8JyQufBxRkM+WFHgrGCfc
         N/Q9fiWq1T8g4Jy/MOA3oMy1f3Dtxlqqx5T4fwRrsczjcYQJE8xoC3XiD4YykBNVBxhu
         uV7g==
X-Forwarded-Encrypted: i=1; AFNElJ/6k1eNuZXLBCUDKWDCRYCDrEO5M1Cy1U7nkPGDlhcEuR5qCRETXOWHVae70th5DCBl8fZIT8/2zmFh@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yze0ZSNpHWwGIWXKAjExZEAquWfF19yFNwiMHAV7kLl5OR+6qBX
	3KITiZcs4TLtwsiBhEdidX6KiERgTvLrtCCgt2+WjM0bqzgIfr/b6pOTe27gxr2IcuCYhybqCnM
	YfudlJHBFSPN9dvoWwEnfo9XE8sjnco6Wap5Vpw30PD4sdSDumwRLMrgBlk4vKt9lgDZfC5g=
X-Gm-Gg: AfdE7cmQ936nHH1pSB460tPZ0JFCytwOEt2UDNkH4vt4X74HpgL9MEUhOCsCMiBbwws
	ZH0DdEkYy6+aDjYT8gx1GwogSOpFwToZCtFClutvVg/H8Q6Ca7oGDp5u5qgq/ec8bSrDqrmz+52
	GXFa5E6Sm7i/x/mhjlFn5a23l4Wko18vHazCrxqwQr+Q6OKr7dVeBK1e2BVeeXaun1jTD/ydE/P
	2PMDvYLJDOwpuROBGHXhiQvQxgvT4OMWBUsvtiy+PaWaJVWbMvVyMbx75PVvcVWBIJ85uspTQvY
	qyHX54E5NlLHL7zZU51y1OxXchYyIe5o60e2wVAc6TtHFxhCzN1G/Wy1om36/K/CeDYo+RZBn4P
	Yvc2rqkqt11lY0JjNlCqOJM6aIaPBYbQEba3jfnHbaiFSTnCatATUUJbnWmRYEQ==
X-Received: by 2002:a05:620a:4511:b0:915:8502:f7fe with SMTP id af79cd13be357-92e6d7dc6cemr404388685a.15.1782857328387;
        Tue, 30 Jun 2026 15:08:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:915:8502:f7fe with SMTP id af79cd13be357-92e6d7dc6cemr404382285a.15.1782857327863;
        Tue, 30 Jun 2026 15:08:47 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d9daasm28380565e9.9.2026.06.30.15.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 15:08:47 -0700 (PDT)
Message-ID: <6bcfcfca-aee3-42cf-baba-9a926ef26471@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 00:08:44 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] sh: replace linux/gpio.h inclusions
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
 <20260629132633.1300009-5-arnd@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260629132633.1300009-5-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J5OaKgnS c=1 sm=1 tr=0 ts=6a443e71 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=LfsA7Cq2GQzuzbZ-N0YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: pKZhhehucwIpHCG_XJwnfq6dtL8SqcxO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX0CV82No9LIWc
 PfxDq7tUEBnaUuJ7OxZyodkgnMkeSYdMwOcbGAYiH+w7gR8mWw+8UP+n6ZBeqQSCjnoYyfbIs9x
 x5bQqMmw00eIJJ6XIEvgyaYVgyPfQZo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfXzr9zp0OvIv3N
 WiwUGfIJRvdT4RixNRt/1NZbc7muNIMPWzwEDjqzGc+pXvcR1PCipi7uwO6pHefp6va941jxF0N
 uEtDpeimVYsrVXQ3dgwVRgqdDik/RXEJCk9Vln8CHK36KHEa/1vtXFobJAORgH1J3us0zb2VlWQ
 L76A0DgTY94Hg9u4o5YrbLAa9tRCENV5CBIxljV+lE4QN+SzjlAF7DyEzwV9A+eReXBOJjK7Nth
 NbkU6HvETz3ng2V3F4PTyFUY1B7Frh04+n7psUcIKYMjqKVvcYHg23dFUyX7Y1ksbzp4nRPJW4I
 32ZctrfUu+N8qF71EDrPVmVSqp7OOvu547/+KRp8l3Uw0g9rmofe7He47rquBOk0dCm6oi2dapv
 cAimNnf2Gy9hlFnPHEHTx45YSkQ2zxIKIzy7XjRQvNHFHv97QYlGUROnt3huyvQHmZV8wPH2yTR
 P0NJU+6TTEXmohW5uqA==
X-Proofpoint-GUID: pKZhhehucwIpHCG_XJwnfq6dtL8SqcxO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300216

On 29/6/26 15:26, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> linux/gpio.h should no longer be used, convert these instead to
> linux/gpio/legacy.h for the sh boards using the legacy interfaces,
> or remove it where it is not needed at all.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/sh/boards/board-magicpanelr2.c             | 2 +-
>   arch/sh/boards/board-sh7757lcr.c                | 2 +-
>   arch/sh/boards/board-urquell.c                  | 2 +-
>   arch/sh/boards/mach-ap325rxa/setup.c            | 2 +-
>   arch/sh/boards/mach-ecovec24/setup.c            | 2 +-
>   arch/sh/boards/mach-highlander/pinmux-r7785rp.c | 2 +-
>   arch/sh/boards/mach-kfr2r09/lcd_wqvga.c         | 2 +-
>   arch/sh/boards/mach-kfr2r09/setup.c             | 2 +-
>   arch/sh/boards/mach-migor/lcd_qvga.c            | 2 +-
>   arch/sh/boards/mach-migor/setup.c               | 2 +-
>   arch/sh/boards/mach-rsk/devices-rsk7203.c       | 2 +-
>   arch/sh/boards/mach-rsk/devices-rsk7269.c       | 1 -
>   arch/sh/boards/mach-se/7724/setup.c             | 2 +-
>   arch/sh/include/mach-common/mach/magicpanelr2.h | 2 --
>   arch/sh/kernel/cpu/sh4a/setup-shx3.c            | 2 +-
>   15 files changed, 13 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
