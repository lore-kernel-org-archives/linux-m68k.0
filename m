Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1570DDDDA
	for <linux-m68k@lists.linux-m68k.org>; Mon, 20 May 2024 17:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716224901; cv=none; b=ZDqCZ/iNPAj/B2bq9caFJnVYGXhirWo2sQnl7KEGCMTancUxrn2MQg6WOtDtFliIWD6vZhjpKqSxGVNVicVZg+NA3asX0oPu9GH20vEVkyzD1RsAHCBw5baNyK6nJxAsQBzB0jfHwxuJsRSu6MwlHwYuiBcdjcr9VmpwOd+JKmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716224901; c=relaxed/simple;
	bh=aFDFV7c2EO9gllXp93HNqTN0qd4NN1nN+erq4Xp9/Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UVfpaY51KhA8UKbddnaKHp8zVVIkD43jU6lbsGGkgmpwQHjYbWuo0P0LoODKTtsdpLBFoKq/0ZAAP8ekCptMfFPzvuaeQU9X+ojUKVZbWnrh0aLc1MsjKMLCYRaVlacPbSZnPd9Uj4ABurNCsNO0OadluuJegTDBnNSVgCppegk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BuAaEtal; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BuAaEtal"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5231efd80f2so4932379e87.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 May 2024 10:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716224898; x=1716829698; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RMVVKCry00yF8Lm9vKv75tYBmS2dh7fh221cHNlGcCY=;
        b=BuAaEtalknKI1DzkbUWmiPw3KQbREm9w6tsXXOtV/At1fFcXaTdGMdm78lZUTPfkIv
         cGa2sgw8mfhEdchoVkPwTVN56xK5nycFg+J6izl+Pr/625kckq+uptRiYapXll4Kf3dw
         KojfcVbcfQCJ+u4lHGllnGrx0Mp/cl4neVXoU3FDWBYFG0Z0KDFwj027EXDBZeKzWjlE
         1MyLfXMJ1uREnrOWed0WE8MFCCYPwc6pDmmhTAF+FK4w4bZUguUguYH43OgczzGgUCLQ
         r6behEYyqyXrpuIXuY/RnuVhOvghk8QVNNk6uFJ/mvn6RdwMLl4rYuIJjz+nSjsCVVoF
         leXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716224898; x=1716829698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMVVKCry00yF8Lm9vKv75tYBmS2dh7fh221cHNlGcCY=;
        b=ZX1sIr6oDzfF9v8309TsfrFkTQDGRGg3XHgsPvTfsLodjevCO4zWbZhcnPldBW0UKM
         ddrWQJi8Xfc/AcrivhSlYRReDP5b1cGnHrpZlqR18lsx0ucuacTVO8MFsI8AdYRIGXMe
         D4Bl3fqc0Bgu09SGNbQ6ZCzNcK7cnTPSk+CrxjfRcqlNn7tNVr5M9QTorotDaj4bZlau
         57g3fLPXxODRTuMS6A8jLUZ03uBNoNaSm9sflinPr3tzf3+pYCF8dyFsL8Ev+jEHOTcv
         doNUSPXsuS9MhfaTldyJGvcZrVX5qHO4d1LxJZ3o+DAVILEIsANsceMnrAkF1C5veQYw
         mAfA==
X-Forwarded-Encrypted: i=1; AJvYcCVYwepVSztFT5jVdVB0QQD9VNTqvEPM4rru8qGUloxYmDB5A4VYrOA90PZ+SpfBAELeocJHNd6O5PVLj/XjhKRrH+qZR43nhcgJeImpS+f+
X-Gm-Message-State: AOJu0YzQ2/GJq7xbgrM1XXW2h9/nR31pk4CXtQPPvZIXsR5ci5SSIWaL
	GCq3Tt0N243wxpI2aOLVHRHjS4UtoD1TLi+qtZ3fJR0Sui5HUlKk
X-Google-Smtp-Source: AGHT+IHwJbN8ztOkjJbVRaez/gUuqMnspJHUvrNkJ7m1KTXpBG/v0yoMjxSPTW/8qayrJd8lEThY0Q==
X-Received: by 2002:a05:6512:280c:b0:51f:53e0:1bc3 with SMTP id 2adb3069b0e04-5220fc7af9amr23642073e87.25.1716224897687;
        Mon, 20 May 2024 10:08:17 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:7b2d:4f3c:32d9:92a8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7ecesm1477943166b.112.2024.05.20.10.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 10:08:17 -0700 (PDT)
Date: Mon, 20 May 2024 19:08:16 +0200
From: Paolo Pisati <p.pisati@gmail.com>
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Paolo Pisati <p.pisati@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: Amiga, serial and SYSRQ
Message-ID: <ZkuDgC8QcwkIw85E@amaterasu.local>
References: <ZkjwzVwYeQtyAPrL@amaterasu.local>
 <e9d97c04-73c2-e6dd-6d51-b9a4e3ef73b2@gmail.com>
 <Zkn9lwawFGzSJFSF@amaterasu.local>
 <CAMuHMdXa4BFYGSAfoPHP7hntFh2rKmFXx0p44vxua1KsfuHR1w@mail.gmail.com>
 <ZkoEq3TK//srW5D+@amaterasu.local>
 <33ec1596-11c7-4591-95bf-74009532dd3c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33ec1596-11c7-4591-95bf-74009532dd3c@gmail.com>

On Mon, May 20, 2024 at 07:12:41AM +1200, Michael Schmitz wrote:
>
> Odd - maybe ordering matters here? Ordinarily, it doesn't but I've been
> caught out with using wrong option separators before. So, if ',' isn't the
> correct token to split the console option, the kernel will stop parsing
> there and won't see your initcall_debug option.
> 
> I use that option all the time, but I have 'console=tty' instead of serial
> console.

No dice: i've tried several combinations, and the output doesn't change.
-- 
bye,
p.
