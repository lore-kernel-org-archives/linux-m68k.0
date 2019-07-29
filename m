From: Max <max@enpas.org>
Subject: Re: [PATCH v2] ata/pata_buddha: Probe via modalias instead of
 initcall
Date: Mon, 29 Jul 2019 12:49:23 +0200
Message-ID: <c64543d3-10ee-c1a0-0010-f352d6fe937b@enpas.org>
References: <20190725102211.8526-1-max@enpas.org>
 <CAMuHMdXFW2mEg8jChA=JFt-u9NMGp9m+1FnoGe=+Pxme3O2ESg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXFW2mEg8jChA=JFt-u9NMGp9m+1FnoGe=+Pxme3O2ESg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-ide@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On 07/29/2019 10:53 AM, Geert Uytterhoeven wrote:
>> +       switch (z->id) {
>> +       case ZORRO_PROD_INDIVIDUAL_COMPUTERS_BUDDHA:
>> +       default:
>> +               type = BOARD_BUDDHA;
>> +               break;
>> +       case ZORRO_PROD_INDIVIDUAL_COMPUTERS_CATWEASEL:
>> +               type = BOARD_CATWEASEL;
>> +               nr_ports++;
>> +               break;
>> +       case ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF:
>> +               type = BOARD_XSURF;
>> +               break;
>> +       }
> 
> Please obtain the type from ent->driver_data instead of using a switch()
> statement...
> 
>> -module_init(pata_buddha_init_one);
>> +static const struct zorro_device_id pata_buddha_zorro_tbl[] = {
>> +       { ZORRO_PROD_INDIVIDUAL_COMPUTERS_BUDDHA, },
>> +       { ZORRO_PROD_INDIVIDUAL_COMPUTERS_CATWEASEL, },
>> +       { ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF, },
> 
> ... after storing it in zorro_device_id.driver_data here.


Thanks Geert for your feedback, this is a good idea. I'll make this change.


Max
