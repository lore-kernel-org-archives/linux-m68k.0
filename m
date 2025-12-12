Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4194329D280
	for <linux-m68k@lists.linux-m68k.org>; Fri, 12 Dec 2025 12:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765543220; cv=none; b=gwXab2ITiREGrmw4tIL46h4k0AFJLrAuSFvin0KEkCE55K7GM2W/9FxP7n+3Rhm8Cph/lS+O0YoplNmAGIkyv8jmAvY23FykxTVqD/UnjkLpLrMNFPYmBs2+yDy7ud0SpZq8P/c4ZfMsKjh+NITDBV2qZ8S4EXKpZmDDBaXs33s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765543220; c=relaxed/simple;
	bh=6IkAnb/xuxxNHRYZrb36bdq0tZoliGJjyF01MUzF1sQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ij6tbV19nNQ0i6iiB9lcu5T6eyVdjRrYEgQWer8GUFoN7p9nDy2qQ5wRfi6QqQHY1CU9vtInuWJYRjqS9kTnTyngGexgVsHkMiOECGuzuRhbi0u66jSu5OJm6cYKj2qCg0WFMe14U0bl0hfQniWVWkQ71RTOkvzZiNXo1bx+tLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=JYqDf7aR; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="JYqDf7aR"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b77030ffad9so185430566b.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 12 Dec 2025 04:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1765543216; x=1766148016; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+B3c4eEzbkE5eKgwCbIzGlt7X0JvNerpY5J/dR8ncCE=;
        b=JYqDf7aRYtR+gBU+nLRditHLfRqtCHQBVMAWKsKw6+JTUXg/mWnQ9TKVOvjeclv5et
         a4MquLCJ4BZX/qaMWq7cPHUiiQGdeEq9ejnJ05wGGxKW1TOTPA7cgD/wNbaBsf8zj9kI
         eMRdIm/HNQerCp3LYDS7GiC4dmM3xoiVTPZEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765543216; x=1766148016;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+B3c4eEzbkE5eKgwCbIzGlt7X0JvNerpY5J/dR8ncCE=;
        b=Gv5RkAdOX4qe93RwJs7FBXh3VMZmi4DxXRRMvst07pvfqxSvrkQybcCOpOqGehjiCZ
         u81vHroiz+WBnW5/Lc9qtJQYgLJe5VC3HNGvkPke11ZD3fsK4JCmvLU93kWTpuOE/a8p
         RzPy+pNy9Ot7acGdavC+sURlGsX9YocLDWrYv4enyOKrbSsonpx7V4HBuS60EHg473ne
         Rb+pmHVKtUC5h9fsf9kRyHRnpk7smuk43sPgsnUl67Ep8i4SBgDBX4KPRVMinwJmtgJk
         KqUMrFptUgWlwL1Dv51jW4wTynZTl8OPE1d6EqRtk641RYqw6DntpZtbjFKiC7ocns0T
         BcWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn250Pi2UWCmdV6HLnI0bTpotza5A6OYRZwETe1i1Hx6fYSLHy31AotATkDtDKc0YdvLZfC0vqBXfQ@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz6G5e65r96vZY+lOECsoMbxqJpaVTlI+mHWB5EyXBHDoZmOVpR
	kJTcpZIMa4zBsbgIS0ab0xIzbs+PF2/8UBaSUN0yUAkJQBfIVfpkQ+btNYoAGn9T78wMx2ZGKub
	DU+vnU6NfpdaznZ1pHfGOJfn9rwBDpTMGtEllKGOPNg==
X-Gm-Gg: AY/fxX4dYqrjnZ0j5rFIOpOgis84kARbpj2B0o8OOLLV5AxHg8kg79nSnS2xzw2Fkqz
	0zxr/K7zhpTkgDiosZc1DOqgQuJsCdfJA5DZlX90qgJN2ArB2cqq3wDv9OLY0poJ+yaYY7LYfCP
	iImwRyNK89u/1ahpxxV/axr6a9vJXMz28qaoPnG5Or+8FjCQvklNoZaN1M3UQ2z+f7aom++OKz4
	syYwsqOoTz7Ma1bNSeiYDBhNQ0vt2jSl9TM5cavNpya6sSsnOgpQFXFKpekT2gFYQJ/I2CClb4a
	rXau4QE=
X-Google-Smtp-Source: AGHT+IG/Wtb5AT0oaaQ8p0IcWhSpQ0cC1Q5IKnPliQP76ByYsfD19TDAdxkNCCVAazIzvfYXjN1Ehrf9IpkIi5P1B3c=
X-Received: by 2002:a17:906:7954:b0:b7c:fc5c:7ca5 with SMTP id
 a640c23a62f3a-b7d23aede6fmr160789766b.49.1765543216169; Fri, 12 Dec 2025
 04:40:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251212122930.36115-1-lihaoxiang@isrc.iscas.ac.cn>
In-Reply-To: <20251212122930.36115-1-lihaoxiang@isrc.iscas.ac.cn>
From: Daniel Palmer <daniel@0x0f.com>
Date: Fri, 12 Dec 2025 21:40:03 +0900
X-Gm-Features: AQt7F2qdlNBbRsxTvXnoDHGYjx13obqtEsZkpPqI3zaGpsBapTQNabWempKWMtc
Message-ID: <CAFr9PX=OsSBGbw0HCh56ToNDsjU4JVRhFsnW4Ds2HWYu-HqD4w@mail.gmail.com>
Subject: Re: [PATCH] nubus: add a cleanup in nubus_init()
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: fthain@linux-m68k.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Haoxiang,

On Fri, 12 Dec 2025 at 21:30, Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn> wrote:
> +++ b/drivers/nubus/nubus.c

> +               put_device(&nubus_parent);

nubus_parent seems to be in drivers/nubus/bus.c not
drivers/nubus/nubus.c? Does this compile?

Thanks!
