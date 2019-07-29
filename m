From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH v3] ata/pata_buddha: Probe via modalias instead of
 initcall
Date: Mon, 29 Jul 2019 14:20:34 +0200
Message-ID: <2fd27e50-8462-45e0-f158-72425ff648ac@physik.fu-berlin.de>
References: <20190725180825.31508-1-max@enpas.org>
 <CAMuHMdURm-9nazOBTL8uRH8WMt7gi=QUYy0qr9kaxzczCr+ujg@mail.gmail.com>
 <9cde6e79-52da-e0c0-f452-6afc2e5fa5ee@enpas.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9cde6e79-52da-e0c0-f452-6afc2e5fa5ee@enpas.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Max Staudt <max@enpas.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jens Axboe <axboe@kernel.dk>, Michael Schmitz <schmitzmic@gmail.com>, linux-ide@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Hi Max!

On 7/29/19 1:09 PM, Max Staudt wrote:
> Unfortunately, I don't have any MFD hardware other than a single Buddha to test this with. I especially don't have an X-Surf, hence no good way of testing this other than the two IDE channels on my Buddha. WinUAE doesn't seem to emulate the IDE controller either.

I have both an X-Surf100 and a Buddha and would be happy to provide an
account on the Amiga with that hardware for you. You can run any
tests you like and install any kernel you want.

If you need an older X-Surf version, you could always ask the guys on
the a1k.org forum. They are usually very kind to loan hardware for these
purposes.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
