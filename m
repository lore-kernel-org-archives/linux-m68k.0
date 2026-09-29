Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBC12E8DEB
	for <linux-m68k@lists.linux-m68k.org>; Tue, 29 Sep 2026 02:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790649046; cv=none; b=X/FkIxxeTn/+MlwPB3w0cRUqCTKeDT0AcMNdA4IXlEH3xXfsYYRo21OVUuXm4/W+bi0oKCVLjNGvuG1s3fyAF/lLM1i+t9d6hEDVMiT/wb1LDv7UyY2fYKgIiNNqoUx0WnE3TeQYB8iWW7dfPY2w/Tl4y+u1fe0OpyABnoRHnfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790649046; c=relaxed/simple;
	bh=RqMpdApkW8ajUvKlzsHEFDCamm8McSuEQxfv4BjZxdg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WTx9IFz6ZZfxSOpuhWoootcIf4n7YodlUuTs5h1cdFd3jWJeNgiSGZi58K0iBpWp+05E9AU2uOMTCrnuBZjQpczmNOJ1Z8v5V0HocfcypLN4dTIXAoh4VNFxjhtg356cfm1yHjfzl6tV4ezf2O9Q4h5qJiwnd/dOaeK8j149Hs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=CJYww+YV; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="CJYww+YV"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd04f7f2so2551444c88.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 28 Sep 2026 19:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790649043; x=1791253843; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQ8x0qGG7PntgWtNVA3JU1IAHW0rcEHjE+FOFNOnDsY=;
        b=CJYww+YVsWvaPlHlie6xuuXtgnApejpW/FftXnzIoC1AiFzfUb2JLYN1pGejrdyLpC
         PC4gOuUM/w6BeCgy8NleWg0I+3RrOR5Mb3WGJ45eC4scrRB9K3wudCJn1XsHwRSMVBNT
         z5ggQx0RlTP7iOvPWaCnQqVNnor1iHicAtowtexaJM3cJFInY+a9Nn+s01Pp4xWFhrMQ
         ddp5w8gmgxGAituAeWxk2/yV982cRMA/FgD/GQW9MLECyqmApQ3toiZaG27IcYPx/ZVJ
         FxOltqY1A3QPpzX2ua9b4Xsn/eWxGwYzyDR8XqyySZMnltTZuFmDGtuzdrfgHCDJz60Q
         c45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790649043; x=1791253843;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQ8x0qGG7PntgWtNVA3JU1IAHW0rcEHjE+FOFNOnDsY=;
        b=uyzjUE8ZXOqSszyvDiF42tovS1xpQ75IhyTogzNU2H1A6DkjO5Kiib/yUOwOZpNaRx
         4keGK56y2vvwl9XWU0Dj/aj4nH/oIebz3zEYiOOBj67SBUu2HN4xt1gEGik9LMNl7GcT
         lytYwEu0HjqW5l+py3D83Fyu0j9iQ4wXV7UFF7bnncwo5I5RvtSh5EdzQrDdSBa9GXJr
         Qerrf9VU3W+nSc9oBZY1enAAzpuk9TDNgSPPePRi+Uusg4HqcQRTlwke536ykym5Ralk
         LER7CD1OeRUuEtkYm0oV5k6kwnLo/4UyaY16dXX+Ukaw1rCBwYFMJSkAhGYjbZnEDAzM
         Mvyg==
X-Forwarded-Encrypted: i=1; AKwUvBzLjX/L7v9D5FHam55zG1ZOTUyWmQSOta3vDIpjeK4sn8f6xvba+h/R9s4AOOwUBdiERRCbG+D+Wq8B@lists.linux-m68k.org
X-Gm-Message-State: AFuF++l4Z0L1X9dJC8bBx6yiHrev14f/HPbPQdaourR64HVbOdDFYTKG
	auumGTRHJBu8cUizMWSz5BTXQHY97NYwS67FBeWUhDb6p78d8YICc62lKfdpakYyM78=
X-Gm-Gg: AYBFou1mi47yFLAHS2pT4eiaQkczgPjfKGyZUnWy/zAg3CDZ+mGyq6vWzbG4H26Cn8C
	Ipuq+0rf/icI8Af2bC2bluJM64P+LifRLc8RlEhihwqdkjbpsbo+XovJqP2gAhhDSWrAJTDKDAU
	deKitQnjtr5UKcDziXtOPzxOnjW2VsGDdJnqnhPpGpcFV+AZ5ioo/+CeTaKOtsDp6VuH3pdZ8wS
	aDrLxPS2DkgGKOPFwdYF8RvyciYdp8PWBCzCR4fV6E1xy0a+zOHQIKFU6pD1dS5zi7MGHrU9c7l
	rfELWuGny03AR4K03yGbOg5M9bF4/EhIWTull0TTO2m+DEd9ZqG/27sqy/6rYD4tDKPW43oey+1
	ZnTOASjmxbbMhdNbDeO774yuvdEI45lGb2oc48815ZR8HGCHLTAA9HOMYS7DuUPYQhOpxgmM+UR
	MTeTDV8uF+EhXyB6R2CxmxL6vw9nFnoR+tEuntGzbygGRtxOJu95Mtzl0IPwHJPeWf82SYaFhrk
	ewf72NIFgw7tjFLQnceeyTIamJsJkc9B8IQnG7GAPhb9cv8TkFayiGXHg==
X-Received: by 2002:a05:7022:1187:b0:144:c128:4c4c with SMTP id a92af1059eb24-146d077b4e5mr11330684c88.37.1790649043076;
        Mon, 28 Sep 2026 19:30:43 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341460f5166sm33417380eec.29.2026.09.28.19.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:30:42 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Joshua Thompson <funaho@jurai.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Laurent Vivier <laurent@vivier.eu>, Stan Johnson <userm57@yahoo.com>, 
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org
In-Reply-To: <cover.1790641175.git.fthain@linux-m68k.org>
References: <cover.1790641175.git.fthain@linux-m68k.org>
Subject: Re: [PATCH v2 0/3] block/swim: Minor fixes
Message-Id: <179064904203.1187619.6436512745094022925.b4-ty@b4>
Date: Mon, 28 Sep 2026 20:30:42 -0600
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 29 Sep 2026 10:19:35 +1000, Finn Thain wrote:
> Two old bugs were reported to me by Stan Johnson while he was testing
> my recent patch series, "[PATCH v3] block/swim: Fixes and improvements".
> The following patches fix those bugs.

Applied, thanks!

[1/3] swim: Return -EROFS when opened with BLK_OPEN_WRITE flag
      commit: d8fe777978a12a96cb5d10d6d888720fcba2da2b
[2/3] swim: Fix FDEJECT ioctl for exclusive open
      commit: c76b93df9ae61d8ddebf6aa3bc218252f85e80c6
[3/3] swim3: Fix FDEJECT ioctl for exclusive open
      commit: ce054fbe9a4bf4ffefef0f8e2504ea54da058ed2

Best regards,
-- 
Jens Axboe



