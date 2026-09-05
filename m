Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136DB38F250
	for <linux-m68k@lists.linux-m68k.org>; Sat,  5 Sep 2026 08:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788595355; cv=none; b=hULBVA9lFW29W6nZvHqQGkgc5Ypate/pg90sAZmtpwlwyY6WnNe1QaN8kNk7QnccZcHUvWzkM+SCyK37QL1/lfM1mkIh1Lf7TJwa9YuCeqSo4rGeULOxXCbvTxN50JZgk4O/fIOJqZCTCQb5P7GlodDuyJncQqcIv4zFcILKVsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788595355; c=relaxed/simple;
	bh=R8I8oweAS9knfvlYcgDOolf1C9n809RgicPSKaghaHA=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=qr7jk61CaHQ2ET6NDxExu9uGSPvafp+LqnsBCUBHXyyfz/MT+vkkVs7C44dxzgOq9UiQ4KYxf64VwCIJEw0/BcAcnNRjJoXwY2kzikFohVR8BaQjaY/TGNyh1LRbEDqtEQg9n/j4nlVY9PXcdFiJsxDP9syO1IA7Aiqm4jj9aKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFynPfiv; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFynPfiv"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc439aa0078so1555268a12.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 05 Sep 2026 01:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788595353; x=1789200153; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k4a8kETbbno+r0apC2sHIp95ZZ7jnRlfEcHkEbZMrCc=;
        b=DFynPfivKQbLBA/RQJaicX69rXCQyW0guEab/tv8GanOVvHx7oLbsiCYaWoWr2zYy1
         MR0fNlNw3XSMHVmmEvsC9LmNM1kE+J0Udmkbx4XvyxE09mxtp5atojtXGTnkxTIRI8VT
         VVpdRSt2oX6WV3z23vxIbo0UDoKPc7nPysiW+9+FKFRKROqXTBoKqv3wP16/76RBY+p/
         CWgu2YYW4PGHusiKONCgj5TdI39of8HvE0zCKiYa64252kWZ8qNCtAs6cD+CBO6yRwNn
         7vZd2iTfV3RU0nBEwrhDGUsZwIn575ou2t+xfrJxzjRRbZMCNG2deLEJ5k6dwnV7tQ3W
         DlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788595353; x=1789200153;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k4a8kETbbno+r0apC2sHIp95ZZ7jnRlfEcHkEbZMrCc=;
        b=lnBsVJEJSCaY80Vkh16GLHyQlndGksVyV2xvViz5Ch22Pd2+7BGPHjvPl8a1s3/QvB
         j9UfrXyzFrry1u0r9r22MHcu1zfyeVe92x/zOQbsXCiIgewxDJ/izrKcBG98Rh5ITWWV
         UIchWnDttN9t0lT2fOdZFyl37czUV6EDrS0TyM5j6nGKtWOqw3v2IgNpEO/xeEZle9XX
         LVbE1yQ2hFTqVj/xZri6luqWFcCO5obJhAl4eeWPpz9RqOKVkJqJY/Tpgrrnlm3/46iE
         s/gbgt9Z9rXGMHFcNNj1LTcte3PAIISQgn4tAP7e30UKheymkNwWsA143Hng6KeS++eX
         nGDA==
X-Forwarded-Encrypted: i=1; AKwUvBxk2QVNumEQnpPn4gNW38ICmccOdBsN9EgszPuPo1uBIaY1zaXLNJ6zC9D/mlAWZQZ3YiWyx6YqjUXp@lists.linux-m68k.org
X-Gm-Message-State: AFuF++nyMlE6G0TAcRZTla2ekL0QykrCdxcKosozuB8vEagduzpmG/uF
	5l1q891kEZxnpA6rL9ew+o/ixn17xivhhzLDuKCjlH74wBTqGqURJ9s5
X-Gm-Gg: AYBFou1UEjwcRbV5+m0HZIrpNfcTR/Rz/+YiQKLnYujiUtdHRPiRzaSZ002qRuafMUd
	FsK5yxlehygII8OvtqNBYFroWVcpwEnByb8FdPG+scHPZQI7y1ANceUrGT/5ts44Tcc+JWz4zf+
	aQJ/1bxSf+rxC6HVKg38qTtmBEPytGxLvkJHrS2FY+w7vPfaXeZI/5EuxLyvAI8UE/yroYfQbDP
	Ehy86cvlN3YlFbuC49qiaMbO4myXDQP+6dAFvC1wOdobEJMn6g+Foeu83Czm9F4hdyvEN2popoJ
	XbHSbLgq0kdYYXU6uz5zoj0rxZ5R+y/e2h0M5McOpH0wlPw2rvoENIDe/uSBFq1xorJguC9xcdH
	H9KQztdyJPj8y7uRau1iGo4/HMgbZSchfWMm3gcjYs08OdA70k/c3b8wIKDutn1J16ffHumup9R
	73JbqbEjhgGizoSuZW+tqbky2UBAl0/xcItOqa1HW9YntvHP4H40NFumTEKZej2p+9E9vljImMC
	1HQpUtJqteTg6iSCks=
X-Received: by 2002:a17:90b:5246:b0:39a:e983:d4bd with SMTP id 98e67ed59e1d1-39b262a3cf7mr18232824a91.24.1788595352899;
        Sat, 05 Sep 2026 01:02:32 -0700 (PDT)
Received: from [10.1.1.24] (122-59-250-182-adsl.sparkbb.co.nz. [122.59.250.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacba5sm15543669a91.12.2026.09.05.01.02.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Sep 2026 01:02:32 -0700 (PDT)
Subject: Re: [PATCH 1/9] docs: kernel-parameters: Drop the atarimouse= entry
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
References: <20260905070347.25902-1-kmehltretter@gmail.com>
 <20260905070347.25902-2-kmehltretter@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 linux-doc@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Steve Wahl <steve.wahl@hpe.com>, Dimitri Sivanich
 <dimitri.sivanich@hpe.com>, Tony Luck <tony.luck@intel.com>,
 linux-edac@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-omap@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 linux-ide@vger.kernel.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <762382f0-87cd-2148-9846-40448c7b1702@gmail.com>
Date: Sat, 5 Sep 2026 20:02:11 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260905070347.25902-2-kmehltretter@gmail.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi Karl,

Am 05.09.2026 um 19:03 schrieb Karl Mehltretter:
> Nothing in the tree parses atarimouse=. drivers/input/mouse/atarimouse.c
> only takes a module parameter, and git log -S finds no __setup() for the
> boot parameter anywhere in the git history, so the entry has been stale
> since before it.
>
> Drop the entry.
>
> Found by cross-checking every documented name against the __setup(),
> early_param() and core_param() registrations in the tree.
>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 68647ff4bdd2..c8d96de4c00d 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -591,8 +591,6 @@ Kernel parameters
>
>  	ataflop=	[HW,M68k]
>
> -	atarimouse=	[HW,MOUSE] Atari Mouse
> -
>  	atkbd.extra=	[HW] Enable extra LEDs and keys on IBM RapidAccess,
>  			EzKey and similar keyboards
>
>

The code parsing this boot parameter disappeared in the conversion to 
input drivers sometime between 2.4.33 and 2.6.18 (my fault entirely).

No one appears to have missed it all these years... thanks for taking 
care of this!

Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>

