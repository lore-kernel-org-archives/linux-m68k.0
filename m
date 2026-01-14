Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D454038A297
	for <linux-m68k@lists.linux-m68k.org>; Wed, 14 Jan 2026 10:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768384933; cv=none; b=JNeP25qNYdtoskW0tKIgMyYEuRpajVBs3C3YoryGOvobH3HH91XkpBGh8IOWC9UzQXs2aeYAqO9KJ2VHN1RyedcFjQVWdD2hRmiWbYrpk27GbIyZCce7JMRVzMTYLa3QMj/Ou026HyH1Q6jXt7C+SIpSwskzCvm3yFDf+DddvGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768384933; c=relaxed/simple;
	bh=an3PQRdJRli5xUp+0iFhR8Tl9IEB+ilkJpCoeRs721w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rhQ3qJ9iLs/GPdSwAxrOb28+C6oKlJqFWO3wL6C5Uj21pdn99w0aURWxn6ds12l9NEAtPf6cDNFheWAFDIX+I2Gq3fcmd0C4HQT19pEp1FVLF+bMUxikneYnM2xHebZIVZdsnCEDSUQ0XZIVsnfdIQ7nFut5+s5rHAQyDZzzNxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=soT9n1XU; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="soT9n1XU"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a58f2e514eso10887675ad.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 14 Jan 2026 02:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1768384930; x=1768989730; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=an3PQRdJRli5xUp+0iFhR8Tl9IEB+ilkJpCoeRs721w=;
        b=soT9n1XU+hbX4GUoVSg6o/KRMer869gqJp54rhU3jLGOLcy2jGZYSStT/Us00K7rbc
         wDYYJKfbj68WKsN1yOQxV31V40+cTIwwFbEE0oIJBPa8R07bJzDSngZZMU/YAuIw3BsP
         h49Y5/EJDOR6ouSlQ+Vh2K/RjP+arClpBy31s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768384930; x=1768989730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=an3PQRdJRli5xUp+0iFhR8Tl9IEB+ilkJpCoeRs721w=;
        b=E8lv/MkkoYX+6HWfvmgWPKNrNLizrtRvwIIjZJEiiyJr4KDiLLzhgfeCLlMmsKBbEP
         2idplhxpDrIcV74MRCheB8m6gyZWheCCFw+HarGbMVLp3zMUp72zmvZPSXr5KcP51YKB
         K+uh+giVhaNrl6zpEsI18jfl3HUiRNpOLpgxORdhGY3M1Wv93Se+X3BWtei0MAb49IWf
         8DuFGopjWMsMCQ/JtvtbBQt9+NaaNY0ftlZaHw72X6a1ghzm5s0p96gaW1W1oUtXXCoN
         29nKsHoQ7RuwetXcdpZV50dYAFbu5pdD6PRtQJijbf59/FrtDxSDH+IccOnrt+wKUiXP
         vVnA==
X-Forwarded-Encrypted: i=1; AJvYcCVfv5Ce5kljupTK7fv78H5mDQuR0PhmT+N++YyQAWxODe9tVwTCQJewzjaO49KtmEkAOhviqIM8a4+E@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxouJhkBt2N6Fp6TlCunYlcah5aZcVKlTtSfMHSIqKtyzaQCIHP
	pBNoJqGnXM4CWY5mBvOmZTARXd2cbHH4LgjdmbjuhcPpi8aUZiMeU3aFWGOzSh3/b5pBS23lM5e
	Kdcb/tWpNeZq2WX9SmWvWU3UVnHi1jEZJzFiS10kK7g==
X-Gm-Gg: AY/fxX7QH3xB5XLPI2z742SBlvf2DZiWTwxM+/4iYav0WWd/Wh44WnDJ+Twa7qFK260
	+qOvetxDxNIoKaJzhTY5oB6Ew+ICvVfgdlsvaOCNtOuUaGFEC621aWiTzSUNKi69VHZc/vU+KFe
	bSsUaQzqZds64L37Q+DoKXj0rFFUZq7ipuOPm6u6Vhmhdplmkf/e3w33aDQgzePf+Ox9J2YqssO
	eGiQWrYYkEHMl+DV3b6qzK9NuI9s/TQC+yE85z4jdbaOQk8VSUsnRXJcJyMnhHh5a891EIl
X-Received: by 2002:a17:902:d490:b0:2a0:e5da:febf with SMTP id
 d9443c01a7336-2a599e57f84mr19789975ad.46.1768384930034; Wed, 14 Jan 2026
 02:02:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112182258.1851769-1-visitorckw@gmail.com> <20260112182258.1851769-2-visitorckw@gmail.com>
In-Reply-To: <20260112182258.1851769-2-visitorckw@gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 14 Jan 2026 19:01:58 +0900
X-Gm-Features: AZwV_QgguIt852C_mUjivXJfQcOZtzqwma4T4Ld0LagZcZXCH6S-e9IavQmDjH0
Message-ID: <CAFr9PXn9nzw=kmWqv_ZPZshhGuh0iAW5b=Csygt6WZOnmd2tig@mail.gmail.com>
Subject: Re: [PATCH 1/2] power: reset: Add QEMU virt-ctrl driver
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: geert@linux-m68k.org, sre@kernel.org, jserv@ccns.ncku.edu.tw, 
	eleanor15x@gmail.com, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Kuan-Wei,

On Tue, 13 Jan 2026 at 03:27, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
>
> Add a new driver for the 'virt-ctrl' device found on QEMU virt machines
> (e.g. m68k). This device provides a simple interface for system reset
> and power off [1].
>
> This driver registers a restart handler for system reboot and sets the
> global pm_power_off callback for system shutdown. It is designed to be
> generic and can be reused by other architectures utilizing this QEMU
> device.
>
> Link: https://gitlab.com/qemu-project/qemu/-/blob/v10.2.0/hw/misc/virt_ctrl.c [1]
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>

FWIW: I have a driver for this in my "m68k with devicetree" tree. As
far as I could tell the virt_ctrl thing in QEMU might get more
features aside from power control.
So I made it a misc device instead.

Cheers,

Daniel
