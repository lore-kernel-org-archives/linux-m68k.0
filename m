Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2761426A
	for <linux-m68k@lists.linux-m68k.org>; Sun, 11 Feb 2024 23:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707692811; cv=none; b=aU0Vbr6u/bLtvR1qMuo69zVz1sRZ8WbOispIfk42ZRa3UBstmUbydsBGcpurdF4CpL6DMECeKswxqJHU99LWpB1hIfre2lXcRmdmcGPMDXsdP4jiJLRAEPecBE7deX4WDclEDShy6LreJCFzf4uaWncrXXUIWk9LpShlbgRJ5q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707692811; c=relaxed/simple;
	bh=jtcobRYgNI43bB+fM74E7FhkB3DFmGQyjnJ4YWHpRps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JgOdS8eds6a27Gt65H0Bxqt1dPY34Sc0xR6vQ9i72HV8Eyx+Tk/2jVyWb1BwS5XU2mjizpUsowsWZl/KtAxmlaZbyPgCR4KbidWxqKGxl09WyPTvvkeNoU6JsiM16ECX+g4iYa77vfsw4HELSUjVbAiwG2L2AVFd8YKwosNp8D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=loxPormF; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="loxPormF"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6d9f94b9186so2249242b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 11 Feb 2024 15:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707692809; x=1708297609; darn=lists.linux-m68k.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=gCuySXt9kRwqpI/wQDtgRgdqYmihUz1Tr8Gz7e8ppCU=;
        b=loxPormFHOK1dVAC/TC+iYTopWWGcGSIPFita3KiFTidYxxE/oVS1IIWA6mCtNB8TV
         OUzxy9DT84JUpETqX5xPBj1P92TCyHmxiSIfyNG8RtjkuXHTgzXrKcD89i3gz8AWHBRv
         uPogOJZphW5b9SSH1Sdrztn1lK2RCr/iwzosdF+6MkorOJV4kMkNlaS4ZfGCRB0PdfDn
         1t/3iFm8/hFV2ng7PYdEAklCMpXdhOCK6AdbdPD1aPr5oSOo9G5zfqmOkmeDLCRBpo72
         FpqGFDnJ4dBgw0TfFbFfd6s3PLJIJNMPrZdrTIPz1C8I/YEk3AIjd2TQIErbC7kYiawh
         cKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707692809; x=1708297609;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gCuySXt9kRwqpI/wQDtgRgdqYmihUz1Tr8Gz7e8ppCU=;
        b=IvHLt/KAKUCGHkMZyxxJl6/s+bf7zuja0VakZ2E2TEk/JQrt6SOv+b5YtE10BzUJo9
         XaDA+hkzxNma0qR5nkhgm1qrLC4Wq9a/9a4dslBxrbvXRLTEUH5RfpNfeIuc5ZvrSRI2
         NpvjHrufw4PR85ftkqkYG5/GNzhQfnlVJdZ+cH4VszhvMmxmRMf48d7AGvQlnZBSBlCR
         fT7cyO9faZjoUziiF7feOrCc2VMhUEhH7uEzRi0HfSeKZ4uPm6qNqlXk/b71BbLkyxip
         XhhS+As4z+14rIQXKR31PboJoV74p8z3I1dAi1flEdlzY2YB1NJcCcGoDeYQWTHHHZJh
         RBlA==
X-Gm-Message-State: AOJu0Yxn5pCUBVQNwa3YVAKouVzV4XnRCXgAIguzcH+NZnOA9EinI51Z
	5uF4hCIWmwKEIAqm0LV4anQqD1wFKrfKzfuEQfFWdXWpl0UOe9jS
X-Google-Smtp-Source: AGHT+IGkF8iwmZ1C8WoWCat6qIp7VV/d/IlBX+mHEslKVgouuWxghIkjljZ6xvgkKzYvt6IBsvriug==
X-Received: by 2002:a05:6a20:9f43:b0:19e:a9e6:c05 with SMTP id ml3-20020a056a209f4300b0019ea9e60c05mr8085896pzb.43.1707692809151;
        Sun, 11 Feb 2024 15:06:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXdHbC8J0Ps8b93WpG2q46cOzDyD7bkya8gbU0f2Y98KE+iz2Oe1i3VYX5LqtUpL2lKDFcRRs0WElDBoDX+XbHug3oYlk3MCOp9dIeC
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b30-20020a63715e000000b005cfbec9f8b4sm5564967pgn.54.2024.02.11.15.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 15:06:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 11 Feb 2024 15:06:46 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: stackinit unit test failures on m68k
Message-ID: <a0d10d50-2720-4ecd-a2c6-c2c5e5aeee65@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

I see the following stackinit unit test failures on m68k when running
the q800 emulation.

    # test_char_array_zero: ASSERTION FAILED at lib/stackinit_kunit.c:333
    Expected stackinit_range_contains(fill_start, fill_size, target_start, target_size) to be true, but is false
stack fill missed target!? (fill 16 wide, target offset by -12)

    # test_char_array_none: ASSERTION FAILED at lib/stackinit_kunit.c:343
    Expected stackinit_range_contains(fill_start, fill_size, target_start, target_size) to be true, but is false
stack fill missed target!? (fill 16 wide, target offset by -12)

Do you happen to know if this a problem with the test, with m68k, or maybe
with the configuration ? My configuration is based on mac_defconfig with
various test options enabled. I use gcc 11.4 to build the image. I tried
with qemu v8.1 and v8.2.

Thanks,
Guenter
