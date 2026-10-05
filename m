Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C0B2F6918
	for <linux-m68k@lists.linux-m68k.org>; Mon,  5 Oct 2026 13:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791205396; cv=none; b=DZvfqfRfU8MbyFtbUU1IdlQ59CxCVVS/BfMsoqPufN8y8YL0pbEbwVcvapiIM4CIBYRDjqBQz2TLeuYoloH+1PGBxoWlka3F1Wx7nbtSUpBN4LoyjrKMBwoCk5d2ezUB/Zh5qxGJ8vpLI8PhE0uC8hxavqaCPRY6h2cdHZu71OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791205396; c=relaxed/simple;
	bh=Adb+8bsjlfp1Tnx4ZUbYVZLepO4+npt0YZA23h6SQtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kek5dRZGfYLhlzdAghM2edPyFG8PNQcP22pJtPXwDa/NcHII6BaAhmXCaCVtOfGrYle2pNk6/3BL33qwtuNN9bJhG5h1DRiuzlrtDUiCoIv6RhKpy6ZSwyReG+V6v2HE00ITzYaAyuA2RbfM5Whjf9OP1f2UQemQwPkHopQ1UMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=polyxeno.com; spf=pass smtp.mailfrom=polyxeno.com; dkim=pass (2048-bit key) header.d=polyxeno.com header.i=@polyxeno.com header.b=P1CQMYol; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=V5PjsGut; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=polyxeno.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=polyxeno.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=polyxeno.com header.i=@polyxeno.com header.b="P1CQMYol";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="V5PjsGut"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 82B411400131
	for <linux-m68k@lists.linux-m68k.org>; Mon,  5 Oct 2026 09:03:14 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 05 Oct 2026 09:03:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=polyxeno.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1791205394;
	 x=1791291794; bh=EPcZRCkLQMniNly2GI27KAfCOBl0y2VVYMoBk3mqXMA=; b=
	P1CQMYol8DW0fX4iL+j2Kp4wx9JNFlcwn7xbKxkfAxA0YNMvCdTwmcooikCW+949
	nhO9Y+wOQ1LUotbsYaiQGP31jtmaanD1LB/aM6e/knxBy0trR3QeNTbXtG8dFmdc
	hcwr6eU9wCHd3JHwwkJ0QOMkyOGKzpYSh+YeoUjWbhNsXESbBZbNgz2XfIxPpsQX
	M/OvsQ3pApHdHPzBfKYuGO9lQJhLcD7q5s0RDoRDpHRz1qc3wIc0Vc6t7UxYEmCp
	xdVcMEaojuOaQ1v5m5FvOkjZps5cDEchSLMA6Er6Ysy+5N/akdSKSd8gFgMrLAWU
	n97bnoWRA7H0v9oqsBDKTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791205394; x=
	1791291794; bh=EPcZRCkLQMniNly2GI27KAfCOBl0y2VVYMoBk3mqXMA=; b=V
	5PjsGutOjflopnLMIIErPcb5cjcJr6rJUDlo6WRh+gzi87w12/cgDT0Iu15mmttW
	74SV77X6VFdacIAgD5hf6spCAGFFf2roXsLM6iOwL8YMPfbZnwxxy/eOl6xHQDgq
	0h+Ib+cWf5iAqf6Aox+KI7eRuxcjrxjYTzrcO6zK/PbZZTB+ZrhE4OqgzM1itFG4
	a2y+AAsVmu0ISnjKpPizJjUx/OsciCIaKIpJNUbEvCLWAJRcLtgumIWk0sHxUzFA
	1hSvmN8J6y2PformDGT+w+knK3Ag45tPgN2v5fdla83vuoRsop7wg5SpBPieSd4D
	rCpCVZnikYvz7lxo4rNpw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=polyxeno.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791205394; d=polyxeno.com;
	mf=PGdlcmdAcG9seXhlbm8uY29tPg==;
	rt=PGxpbnV4LW02OGtAbGlzdHMubGludXgtbTY4ay5vcmc+;
	s=fm2:rsa-sha256:P2PzbJt0c3c3EthK0wZYKjUEZxSlAirh/2x0eIl0/vUu2aI
	wvnq2MMPTmFH5n+naO557unrskdrWrpunSxJRiOHRYv/hIssFqhE3Be2c+0iAOzR
	6OcNE+mO00GjbB/MxLq8PaphTL72+2+6TKiqHPzx5JxgBjAmKcGARE4LfNiwts/v
	fISApD2N96IGSeGdu2qUlrbm6Xjh+SWTulyhDTJg8JQ32xf8wOlV3Rdu/HOybaIp
	JK0wqlmpxJFZmXj3qK2gQJHvoSa1BUVZe+d0Rdx5KPWtdMuLRXi7dD4TAp8rGq/b
	t3Hylza6fjYUol8fJ6lnVQPukheotSxlIB3vtFg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:aNm0yXbqNpvoA0n6wrme2U2WBqeAClcBaX7ezSPUHCE=:Adb+8bsjlfp1Tnx4ZUbYVZLepO4+npt0YZA23h6SQtQ=;
X-ME-Sender: <xms:EqDDaomKP9ooKx6yaixLSP53HLIiyX4ODRC5jT6DbqDwSono7uKgsw>
    <xme:EqDDaiwxARcS87qXBvLxm_zFMjgBvwK6tC3tv6VZ5uB3_DMlIjt7YFt8m4koif4cf
    5moyoNpSIGBqCFEK_QjWoO-IvHhkSrat_P2iLSaySjWeGWZBkRa63nv>
X-ME-Received: <xmr:EqDDalruR2haXYKarJr5hoyZv5jicznP7OSrMVkpquT7HJRqjIDNQOY2ciy2yaJrkFxnPhUUZd1A8r4CeJnJdFnXqQ>
X-ME-Proxy-Cause: dmFkZTEOGCFnVfsnIEp+AIU9dPD3MLpKOKB4bW2i07NydgDFpb3ccJxr/3I26ISQMB1AiV
    KlWCX4i8YPW4rCpPb0z44OUSoASu5AAoMtHn8VJhkmAtLISxoElU5G03ay1HNZ8/IxQj0g
    iYiJgD/EVvZIvPJoRgDMncmWZC8dWsxvhqKMsGG9wImQ9vy6xcSBDWAJYjp16XFnO3x1bB
    BpCwlekA6qS9CFnrlmP5vNOh1BuqES48dJHBLl7Y3nKto1V1VxPVnNa6LD10U2uO6k+9yN
    YirS3dmE6lqRYhNEup4UN1kY9uzzC07BYnMPluUnipyGsLUKiCTWBO72nrmTS2fqh+bsKG
    bf+Gjyl+3/cyHfjCmDWD0bD/mU0lnGC5o/geE6i1aXlGlHSLuPGTE8y6JqSbB/FQb0P3V+
    CHfT+6zdT3B5xHl9V/aF/sV6fpEE8qLWVKlKCJS9myzL2dZcTEqb6jQaAuqOkWA8xSmATX
    FSZLsMmWhc9fGJVo41OWhlH+SihcMMe2LXl4xdUHbnZ+KE5bNq/OpE5MTJS8Vz5+nntmA/
    SY2LtRGK8MIoX6aEonOz1+nosZoFjpEmrLzMsF85ladD2vRHx45fOKu5LoDlXg/+r1mD8I
    7w2opbGyM1xZEpu0RKiIHizVTeQCNf0KsJDMou+t0F0pnNTFvvxJoKxt0kQg
X-ME-Proxy: <xmx:EqDDap5ci8xfWsV5_OtbTLv2uzmQP0lI59Cl3inp25orwQ8WRrvo8A>
    <xmx:EqDDakc_eJ3AFwy6NxbMowGrs6fLTCKzVnqg0OkFuclwnoKbERPjLQ>
    <xmx:EqDDam4pMIve-3w3MFJjIKsrP2Cz_-4rhCp09etIhVPZgRm2PfGCnA>
    <xmx:EqDDajtM12VmfgURgZtcB3oHaX22ZAotk-9Qa7rnPaBHF-pnHH36MQ>
    <xmx:EqDDas3wRzthzwG5cFIPj5JDmSfdbGjXBej5gjoMJ6-4Y1cYVQQskuHh>
Feedback-ID: i09fe4b60:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Oct 2026 09:03:12 -0400 (EDT)
Message-ID: <d5e415dc-f5f2-4b23-a9f4-dfd2ba31f099@polyxeno.com>
Date: Mon, 5 Oct 2026 23:03:10 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] m68k: mcf5441x: add PWM defines
To: Angelo Dureghello <adureghello@baylibre.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org
References: <20261005-wip-bl-stmark2-pwm-v1-0-168b9dc653f2@baylibre.com>
 <20261005-wip-bl-stmark2-pwm-v1-1-168b9dc653f2@baylibre.com>
Content-Language: en-US
From: Greg Ungerer <gerg@polyxeno.com>
In-Reply-To: <20261005-wip-bl-stmark2-pwm-v1-1-168b9dc653f2@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Angelo,

On 5/10/26 20:06, Angelo Dureghello wrote:
> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Add PWM defines for the mcf5441x family.
> 
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>

Looks good to me, I will apply to the m68knommu git tree.

Thanks
Greg



> ---
>  arch/m68k/include/asm/m5441xsim.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
> index ea01c7753b7b..aa925fac87f4 100644
> --- a/arch/m68k/include/asm/m5441xsim.h
> +++ b/arch/m68k/include/asm/m5441xsim.h
> @@ -375,4 +375,11 @@
>  #define MCF_IRQ_BOFF1		(MCFINT1_VECBASE + MCFINT1_FLEXCAN1_BOFF)
>  #define MCF_IRQ_ERR1		(MCFINT1_VECBASE + MCFINT1_FLEXCAN1_ERR)
>  
> +/*
> + * PWM module
> + */
> +#define MCFPWM_BASE		0xec088000
> +#define MCFPWM_SIZE		0x150
> +#define MCFPWM_SUB_SIZE		0x50
> +
>  #endif /* m5441xsim_h */
> 

