Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B25250EB
	for <linux-m68k@vger.kernel.org>; Sun,  4 Feb 2024 19:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707075735; cv=none; b=cPU3F2UXQsfIxulaR1XzX5b1wpgeMX+ewE7agJpdFDODplC/PSNNA6fRZU1hO2Mf06JnzsCILqJjfNZnPXWcGeVsAV+v8TX6sQ1I3uDhDbROBhlfs/ptNx3uBkmz4pZlpq1OfWETtMHibjvPL5pGvjLFwdREPg8IL7cO7ptNCj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707075735; c=relaxed/simple;
	bh=cJHKINTZdOU6BQJLcpYy8G9nmxX6/q6DKnhEVzUksJM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=k/0mKXSXCWudklFzbRXFRgG1GxK3dwTdJY42rxVCogwcTFz7iDKs1Pc9g0R7WinONiP1HAqlFezdyAPOe+EJSok/aqpz8gNCLRci4/SZDp9j8+H1Kpu0t07ICe5kGDtgqqISBtJJtKhbQlYulgev0PuOY+8qHbu9sjvU1RNaGwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WvBACMp0; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WvBACMp0"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d8da50bffaso16136125ad.2
        for <linux-m68k@vger.kernel.org>; Sun, 04 Feb 2024 11:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707075733; x=1707680533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qPD8cpBs7b/3VK32LfdYjqDzdG2NmooKZqiQI1WLm1M=;
        b=WvBACMp0QGO7750MYZ7DxvVhJ7dEY9fvG9rnPYSN+sFLs/Ze1w4Qd5dv3SXtDlcBXL
         ZxR84zOI3t/C8lvVeGhR/3z0lD6+hmxqg9kxbjb5AN+qOVri4cKIB9gfRFdJFa6oDN3o
         nh9w4ZR2TJQGbvq2FdLKvonbBoSRSgzWiPRKrqHCIHUQxtTT1rVS7F8qgSK4H7DfUOr2
         KPvJRSS48s+iPDqj7XC+q4RVKWv/1pwvmEChwTXre4YqJG8QYnBTbW12jBH+8YQ20EXA
         tmTLNcMdV4x08W7nG8ek7r3mtcoagtCZkJwyWHL8Aj/REhvUOjAzV/8LZuOM8bBxscqw
         kGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707075733; x=1707680533;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qPD8cpBs7b/3VK32LfdYjqDzdG2NmooKZqiQI1WLm1M=;
        b=nhTlu5wUJ+0kNLtOHuW3WD2Mv4tOV1O2niU3sK1FHSIXBiyVm/gO0/ZhRh2ZB6FRTY
         49YQ32L7IyChxrCMRCuWreSM5aMfmmGUcUq9qs5iZkT9voJea9Nb/+1Ob+NDkyz4zkg0
         il+7VAiY+iivdvwYmKU3djoPpshrC/L4pTzJTDpE4K/ERNYIP3CsJ/LsbzNh3bdZtSkH
         fgogMEF6o0kvOQ39QTY80mNbKJL2q5jt2IS9YRab+iEu3U48CVMEyfAS1pbuSigt/ySJ
         QyUwBRsc+wte4qSRyMwWWkAAITkcuN/OfUD3Qy+cTruiyPM4/6k9jki0VtCE5TQE/BxW
         6V3g==
X-Gm-Message-State: AOJu0Yx45PmN6HqzW37cRCuiUeky2Nss9F8ZiOhxuZNLga/w8AdXcFcn
	6BDQe1sRxOKiNcLrdoLcznHFDBS9KfF914pwlyPDDiPNQ4VlqUZpA5YupcNt
X-Google-Smtp-Source: AGHT+IFsurT17xown/BX8lJo3PlTpjf/j+Dp4or78QDOeccyDmBhkWTxltgKEFBx1MG4sw3MxpKlZg==
X-Received: by 2002:a17:903:2cf:b0:1d9:3843:3f07 with SMTP id s15-20020a17090302cf00b001d938433f07mr16237089plk.61.1707075732760;
        Sun, 04 Feb 2024 11:42:12 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVrhp0JnhdG4QWxcz2APF7FUxNF3Q5ZibxYEyChz0hy2L85ghcbrGJ5eAsopd3PEpnqYM93Dqm02J6c0cvbA9LQLpqhB9p3PtQWlY41voo9GMMZKrQAdvERZBx6tL6xExCHFdHBWyfd0KW1L44=
Received: from ?IPV6:2001:df0:0:200c:f6:2f34:b460:2ba5? ([2001:df0:0:200c:f6:2f34:b460:2ba5])
        by smtp.gmail.com with ESMTPSA id 4-20020a170902e9c400b001d901c2087esm4847464plk.302.2024.02.04.11.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Feb 2024 11:42:12 -0800 (PST)
Message-ID: <290053b6-0be9-6513-cd2a-15c6247c0503@gmail.com>
Date: Mon, 5 Feb 2024 08:42:07 +1300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC 0/4]
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, uli@fpond.eu, fthain@linux-m68k.org,
 viro@zeniv.linux.org.uk
References: <20240204192105.5677-1-schmitzmic@gmail.com>
In-Reply-To: <20240204192105.5677-1-schmitzmic@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Oh dear...

$Subject ought to have read 'Some m68k v4.4 backports' (or something to 
that effect).

I'll send that series to cip-dev@lists.cip-project.org shortly if there 
are no objections.

Cheers,

     Michael

On 5/02/24 08:21, Michael Schmitz wrote:
> CIP v4.4 backport of Al Viro's misc. m68k signal handling and
> page fault fixes.
>
> The first three are a prerequisite for Finn Thain's 'm68k: Move
> signal frame following exception on 68020/030' patch, and fix
> the backport compile error seen in
> https://lore.kernel.org/oe-kbuild-all/202401310920.sBSI4BHj-lkp@intel.com/
>
> RFC version of these patches to give Geert and Al a chance to yell
> at me in case I got details of these patches wrong. I don't claim
> to understand signal handling in anywhere near the required level
> of detail.
>
> Tested on my 68030 Atari Falcon.
>
> Cheers,
>
>     Michael
>     
>
