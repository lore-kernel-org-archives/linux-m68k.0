Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12B6343D8F
	for <linux-m68k@lists.linux-m68k.org>; Sat,  3 Oct 2026 01:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790990641; cv=pass; b=YXo1OiDu+dSx1LkDCi35GGVbpQus3TWu2350NFzRUmokifCy8K2yY2Uly3DsQPEsxq9pejJ8++GbvLRYt0ihlbPXmabp7aBttZXPvwqezrWskXNSvShzU3t1HLLPDkcTDP16wvoqFmDvruljr9O5llA/tJOmVRI60pkpd93AmZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790990641; c=relaxed/simple;
	bh=qm3xtfAskO9px5QkPFtIomCq0X805lE3eXVqHS0pXzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VSKA8Sjrm+bA/mVefx58MMWUm30KcPOoedUN1nc657O2cNxBYizK+dAyZ6SlL0wXN2C6p3+UTneCxccsH7pKjHrl/lcg1S2NAbU4pU4GcWVesJ7oQdZOijzHZpopZ8Bnp4X/hCcAOpbhQ0i3RXrL1XYasQx5swH+XwSy5GGBoWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=Ot6FQ5n3; arc=pass smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="Ot6FQ5n3"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-149f2b3f2c9so6914c88.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 02 Oct 2026 18:23:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790990635; cv=none;
        d=google.com; s=arc-20260327;
        b=FSZNK/BQT9MCxA9IKk7Ue090fTvjP2zjewYN5Q1FluG3yEpK7XRpcwN1gCw++uBter
         vIlSm3MbkhHMU2mOJW4iHQp98Hmy+fkpgCsbFSxWcnTHOZAIMQASckB/7Mj292i+tCk6
         urDw+FXMaLvO6mNIuBIkxEOUoXv/9nYXQDMXhyVu9oRUqIHZzrMmXdroZW7zRCChOeuQ
         DdKSgWtGDDUPy1dFQZSqHWEGW3x7Gfu3M6V+hrxLhuG1wj8ip5n8tpkK6SqE0eC4yXib
         RLEKSu0r0VXoVoGMdA0WiSq3EQjQO0htuCJQxAPncO4OkdWk2DuwpREqg4PnRVcm1WEX
         +05g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qm3xtfAskO9px5QkPFtIomCq0X805lE3eXVqHS0pXzk=;
        fh=lMnoto3OoyeHnF1i7yFRMq+gfEZNaI0mpBiLtzITnaQ=;
        b=XSnPxuKxz1E2TlsSdLtbVl5QtvpplVuSx6Q0/bSq8VGIHwK8cG/L76u22xzu+S5N4+
         7yT/MjwraJPmo99PrU8kPmktONbOV+lBQ2Q585LcoCF81pP084DkCs6+ZVxw7l2df3tU
         jBvYl7axzQIPmX91Sy615Q9w98WODEOVaBI15AdJaYQYAuzivtQ+NOzyx6evCwhTlHVn
         4ELljQilS+YEsuN7oosT/Pyw2UHnQ0oUxAi3qLg7LXSgco3BGOiknedtNBbLUwRkKHxO
         0rUGRq0vhxLxB9VHCCyeeJVbYROp8pc19f4dpPSQi5rUOb2+jJEuXlmN3LWCjJrn23Ok
         GEng==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1790990635; x=1791595435; darn=lists.linux-m68k.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qm3xtfAskO9px5QkPFtIomCq0X805lE3eXVqHS0pXzk=;
        b=Ot6FQ5n3IpLTbeuQ2junwACkYL0TKlcDKIZsGGIQCRcoCKiD1EymP4LDxbQVgq84Y6
         +5yZanLaxALztitAo/mSZ56XgY+/J/UjfUlVYHp6QqH+aXJrzg5hdsR8QvzVcMmbcnkd
         pHpmtsz+Hj50prRhrNMNvUgDALt+LWYz/KIlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790990635; x=1791595435;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qm3xtfAskO9px5QkPFtIomCq0X805lE3eXVqHS0pXzk=;
        b=l+jOmU9Gd2itOBrQDfA9keP1nT70Ffl+DL+0tY2u1laXvrhTlq9Q9q9c8mv0TUa8ET
         E5AZ660oid5pYSKESxazI3XM1XdfL6fpXGJFkz8yp9QFJSM6XVbqh2tRzMcl/60QcDoE
         xVm/cnA7jqByjTRNqibEVfOZRQbp7zFLuoWQ0fxzDcYsUne6kBTqCXMAs//aN8Hgzs3P
         0gFRMW7j4mhur5Xav5PAuBpqrRzH5UfIDoWJ+QzC0i1eU6ZS2ag69CHjW292SGqibERU
         edzAP5psLhl7SSYliC2AeblcqnHMOMop+aD5HtvQ93eqpNZ/YkpeTfVboVs60iD+Zx7W
         3w5Q==
X-Forwarded-Encrypted: i=1; AKwUvBw0jBtwv15jQr0orP+bPVSH1e+M75/Zs/LyJc+5dHZp2k0rvUAG6oKSdiV0OI2aU6zIP+gj1LCMTAx7@lists.linux-m68k.org
X-Gm-Message-State: AFuF++muXH6uSoOluNNy+sLIzHv/s1M9R4WreJK0EEHTchN6mufS3bev
	HRfzxRJhS4zil51JibxCYiZdSu8wq3Dxgqju9qyGb9oYg1sVcqB+huICicuxuYm/Dykrgrh/rZA
	EfQ706boQjoXxUfgEwo6gPlqJBSQFXpKkcb67PT4tmg==
X-Gm-Gg: AYBFou24Y4i9K8SS6H7n5eLRFmV5RegL2pX7rqincAIGS2va9Fqm0weLoKC1x/egbZf
	gmGuj07fqkx/C1DNiiplGj2P+p9asljIBl0oimmtpWu8CwKBEDpuFueJ6KnA46JW3snEj1JrvzA
	efze118w4oXBhe/HwlXUzyUi+fKmHxMIIcRyZQgTavzLkB8AWwtTfDBBuV5aQ4ZHMevnvi9IU57
	t1uSE+sLPWb6esbmkA1I0gjfPEpjmXEkibQAl+6UC8BZF/FoCp0cD2kumnOa8iA2VE5HzUwwv3z
	MICAl9QIzl8YxUsHVU1fnIb26BRI9zIbTrPVUOSjabMR0K+ozgdOfebu
X-Received: by 2002:a05:701b:250a:b0:144:e59d:af02 with SMTP id
 a92af1059eb24-14f5b413640mr4772844c88.12.1790990634522; Fri, 02 Oct 2026
 18:23:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <88e752e0bca92c7b65533cc1b334052dd272f8ef.1790842086.git.fthain@linux-m68k.org>
 <02c53c37-d2ee-4c03-a8f9-0a757c3af59e@gmail.com> <CAMuHMdVbfUH1ZoFcS64t=gyE_cskMWv6gGvL8pjGirSGvAKu2w@mail.gmail.com>
 <dfcbbc59-4204-478b-b8da-867621056c62@gmail.com>
In-Reply-To: <dfcbbc59-4204-478b-b8da-867621056c62@gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 3 Oct 2026 10:23:42 +0900
X-Gm-Features: AclHuK848pC5CD9UEaQvllBn96zCoeLE1p9yCx9zD8zRQMN6UIL-sqXECJvrsOw
Message-ID: <CAFr9PXn1M3PJF=rcR8SDarYU77b9f_v6Bfq+6=pm_vEO28BjeA@mail.gmail.com>
Subject: Re: [PATCH RESEND] m68k: Handle put_user faults more carefully
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Finn Thain <fthain@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Sat, 3 Oct 2026 at 08:55, Michael Schmitz <schmitzmic@gmail.com> wrote:
>060 tests are still missing.

I meant to test this but my 060 Amiga was doing other things.. I will
test this on when I get back from LPC next week.

Thanks,

Daniel
