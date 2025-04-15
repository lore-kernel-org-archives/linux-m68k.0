Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E1127A118
	for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Apr 2025 08:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705940; cv=none; b=h+bbmvIhAOKDq9UGzPJ7VJRE+RpY0KPqZGsGFNAtmy782rJmdFsCA+Ns7n7Y2hk/6CmKP949k2x9oiqIkFXOWFGIFJmNsSmzifil4zXd6QoygQkvRu78BktdACkk7ZqofkUIYXnNaI8llylZNc5lcVo/+RJ/Fzq+9xYFFxtRkYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705940; c=relaxed/simple;
	bh=EEtamelvEL5oMF5dTsmr5bTfdDwuT/yXwBSnoDyJAdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=edc6fGBMCOVxagCojqWKOBcNCP547aOw6yAOf6o0ioRLInCH/SlRzjopdVQyeUReADvUm1Uq1QQbJlZL2AQv21lBDbHz1uuK4P5LKe0LAhIPNBMbhsjnfnr/k7Q2C0pOjVs508HS7xvzyyzm6DpxfEmfa6TnFJemoybPXUAB4Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RQvo1atH; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RQvo1atH"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30c091b54aaso47267191fa.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Apr 2025 01:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744705937; x=1745310737; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEtamelvEL5oMF5dTsmr5bTfdDwuT/yXwBSnoDyJAdQ=;
        b=RQvo1atHbtWony0a6rY0L9agXfOi7PRqZVCKpRfQyGVyYG1AWRlMmx6nfkwUUpfSyU
         KnsrUxf6cRCjMdTfKwqQyHTXGV6IW7hPIHPyMTzgbrHzH0K9wDLGnro2nXemGa3BKydf
         NQ6+plp3ykdrzMx0bQtX+nzz7oLQnOtp4OrNo2pvUWOteCPmRq+lyVjfnnrySk6ctz3h
         1Oeo8BVzQmDNgBohiZO6807MgzBf4BiyDOy9wjDMeegsDtUGjftQyD6zDNRuM9JMe/Z6
         FZqTE/XZEHCdeHTVQvL2S+s12C8Rv1JyhmvkSrnfpj+yjcKDl0ekAbA8LoKnClXqN+TX
         X6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705937; x=1745310737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEtamelvEL5oMF5dTsmr5bTfdDwuT/yXwBSnoDyJAdQ=;
        b=Fb/xhasl+NoJiU7EUQU4ZJ67fxIdqHhZeCJzSvnO0Slt5wkNbRwFtCxPhVW3vRxIcm
         bAYMX+DpR5ZB31fQYnm3VQ13MHnGUZhiTSQyWOddZA0LRLbhudgYw8DmZVAukNfhmpKC
         poenTvKtWuF90p+Pc8sxXnSabUKlN2jAMZof9w08NCXO1HMV9iFEWc+X689G/pDXsPML
         62WPQpK462Yx9LQbCRJveMEIU24CsggbW4CsRcTT9LmmTyjVs55EcRamR4Po5+6Wpjk7
         1nz1H7ZH4U3TqNNC72mS9cXsKcyu/2CKLCSV/K/bW665qzP0A/PFnd1g6/Px52rwpufi
         sklA==
X-Forwarded-Encrypted: i=1; AJvYcCWlmGYiE3eJWfXtkyHH7JYb6OTUL9967wE5zIIpe/I9p0rXzEReXVaQH1vjUJ5jmg9ZKYZodRdILS76@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzT47XDEQPqG1aPZNc5seDRjuj+P2PutXdcrAJ8Jkya8+v8q5cy
	QpoQRWrnu8mjFj/FQV6+m1q3IMZWVdzbKxttWKK2NYNUDGU4Vns+t/bava4JMjCABLSa1A/tXTC
	nR7Fh7NJKOGx8TfqSkCVJkKgWfTrs6ioIljdy1A==
X-Gm-Gg: ASbGncvs0YYdJIAzNcBb4Gt6Gle2Bkwrb3kOykfYvXBlV6zh4V3K2NCShvo4rDAutMA
	e6JwjIYnSsOkP2PHtng7P54IN9/DPuOIGy4RjscVwrGnoVTwGkNCqiQheW7tmh4xQyk8uROzR2F
	JXWURxi0P5t9WZUlXTfpQXeKegBkS85DWj
X-Google-Smtp-Source: AGHT+IFqHgt85FAtKpysh1GWDt1MaHgR9+EQKoY32RVv1qV7EcZCQfTfkiR5qV5ET1fUQSQ/nZPTWz01QIwFY80tssg=
X-Received: by 2002:a05:651c:2228:b0:30b:aabf:fc4 with SMTP id
 38308e7fff4ca-31049a2302fmr45655041fa.21.1744705936671; Tue, 15 Apr 2025
 01:32:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-m68k-v1-1-7fdc9132b6e8@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-m68k-v1-1-7fdc9132b6e8@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:32:05 +0200
X-Gm-Features: ATxdqUENeFi82570dVSVXEp-45cJFXwjP5cf6PqktWQkh-wVvXZ5PyE19YzMtfA
Message-ID: <CACRpkdZRdyFJaKLnBVHUWor_MhJ-HBoEP=NMYm1are6em4v81A@mail.gmail.com>
Subject: Re: [PATCH] m68k: coldfire: gpio: use new line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:20=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
